Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.3481.1631164298977788693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 22:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R0z2h+wW;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id bk29so590000qkb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 22:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EFpRuW6NYT7lPS9OY6mQEZs6CRGFT+kF8djVK1eeC84=;
        b=R0z2h+wWF2ZUs6tqiaP0NENdN/6X66llz7/dQIi6oqkO+1Yz8aMJOrsG5XT9sxFjsK
         zkVulG88LvDJZHtlvph7Ca88fFyMJIVRDnl8zbpWAs1b9C2zMzlhXWr4EbvMBtS10Yas
         jc0NyJl8amHAnNQvp4JAI+7xbmZf5EyiMmgYZNefg+N0J4FMSyZmj38VahDaVgtg0ZuJ
         ipkcjQE0P6oehRX8zDoV/KBcJRUhsZInmw1UK2dMcOB6xmIViOEOf6NHfamEiippZCSC
         VA3XTmwSU9R2a96ELHjQGxBZcQOVPEJa7tGGEeGlhFABwkYPeLHOoyF4bdb5PTY/SgZ0
         +Rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EFpRuW6NYT7lPS9OY6mQEZs6CRGFT+kF8djVK1eeC84=;
        b=b+2GnkO1kWyeqWFETGBVNgmpQrHOraRmcpt6Vp6LWiCkSS7olg7PMHlEtnA/Wm1lfF
         Rg4eUkfFevVbd7YAZwLVRzg2kJ/9ch8CGDDWrtD6/CWWuIWucJiQssEa1BpWmgd1DHv3
         9THc9cQNaN4ohVbbFN/m5K0VfgOvV8UEQp5aDGZQGNwHcn/sBHhkwR5kplu1oLcxDVy0
         HOmeLegNiiyozkJ941+EKKzKyAKoqhuApnPtCHZpvaLf4SiRSQzoeJpN2Lhh0fC1hAi/
         5TWiRt9UXlt/rrQK/taGpmf7AlX6UeZQ5WgVkhiJu+NYQllz6siooNTtp/S/JeVvqHJD
         pnZg==
X-Gm-Message-State: AOAM5325kCyjUpQJFEGVd2dkLur8vgFCrfJQQF2ll04FCVoZd1p1pXzx
	5YQZp3EwiNUHQFP8ZcOzS599scZdiUHCj58wn59Mp9eQ+ak=
X-Google-Smtp-Source: ABdhPJxGUjzrTW+fS8KnJPbqD1LdVIO+Rk4eS/9Fr6bhCpVirXqL6+U4NMCAiCfFyaK7Zol8d19ABEJ18AxACttZAdg=
X-Received: by 2002:a37:a554:: with SMTP id o81mr1110937qke.231.1631164297748;
 Wed, 08 Sep 2021 22:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210908180125.103473-1-alex.kanavin@gmail.com> <20210908180125.103473-3-alex.kanavin@gmail.com>
In-Reply-To: <20210908180125.103473-3-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Sep 2021 22:11:11 -0700
Message-ID: <CAMKF1sqt1R=AGi0LwN06MatJhsW5LxsYtTFAMrSWA87ypM+tpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/26] lua: add a recipe from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

also send a a patch to remove it from meta-oe once its merged in core,
otherwise distros using meta-oe wont use it from core.

On Wed, Sep 8, 2021 at 11:01 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Lua is a hard dependency in rpm 4.17.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../distro/include/ptest-packagelists.inc     |   1 +
>  ...ilding-lua-without-readline-on-Linux.patch |  59 +++++++
>  ...rriers-cannot-be-active-during-sweep.patch |  90 ++++++++++
>  .../lua/lua/CVE-2020-15888.patch              |  45 +++++
>  .../lua/lua/CVE-2020-15945.patch              | 167 ++++++++++++++++++
>  meta/recipes-devtools/lua/lua/lua.pc.in       |  10 ++
>  meta/recipes-devtools/lua/lua/run-ptest       |  19 ++
>  meta/recipes-devtools/lua/lua_5.3.6.bb        |  67 +++++++
>  9 files changed, 459 insertions(+)
>  create mode 100644 meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
>  create mode 100644 meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
>  create mode 100644 meta/recipes-devtools/lua/lua/CVE-2020-15888.patch
>  create mode 100644 meta/recipes-devtools/lua/lua/CVE-2020-15945.patch
>  create mode 100644 meta/recipes-devtools/lua/lua/lua.pc.in
>  create mode 100644 meta/recipes-devtools/lua/lua/run-ptest
>  create mode 100644 meta/recipes-devtools/lua/lua_5.3.6.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 0e8185f4e3..d9d57459cf 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -467,6 +467,7 @@ RECIPE_MAINTAINER:pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> +RECIPE_MAINTAINER:pn-lua = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-lz4 = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-lzo = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-lzip = "Denys Dmytriyenko <denis@denix.org>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index e0ae1dd971..3709998f29 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -40,6 +40,7 @@ PTESTS_FAST = "\
>      libxml-sax-base-perl-ptest \
>      libxml-simple-perl-ptest \
>      libxml2-ptest \
> +    lua-ptest \
>      lzo-ptest \
>      m4-ptest \
>      nettle-ptest \
> diff --git a/meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch b/meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
> new file mode 100644
> index 0000000000..e767900864
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
> @@ -0,0 +1,59 @@
> +From 601ef636fc4dfb2af3e7fda88d8ea1c1d92affe4 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 2 Oct 2019 17:54:15 +0200
> +Subject: [PATCH] Allow building lua without readline on Linux
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile      | 2 +-
> + src/Makefile  | 3 +++
> + src/luaconf.h | 5 +++++
> + 3 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 119110d..9f6df45 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -36,7 +36,7 @@ RM= rm -f
> + # == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======
> +
> + # Convenience platforms targets.
> +-PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
> ++PLATS= aix bsd c89 freebsd generic linux linux-no-readline macosx mingw posix solaris
> +
> + # What to install.
> + TO_BIN= lua luac
> +diff --git a/src/Makefile b/src/Makefile
> +index 64c78f7..5c0428a 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -109,6 +109,9 @@ generic: $(ALL)
> + linux:
> +       $(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl -lreadline"
> +
> ++linux-no-readline:
> ++      $(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX_NO_READLINE" SYSLIBS="-Wl,-E -ldl"
> ++
> + macosx:
> +       $(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX" SYSLIBS="-lreadline"
> +
> +diff --git a/src/luaconf.h b/src/luaconf.h
> +index 9eeeea6..d71ca25 100644
> +--- a/src/luaconf.h
> ++++ b/src/luaconf.h
> +@@ -64,6 +64,11 @@
> + #define LUA_USE_READLINE      /* needs some extra libraries */
> + #endif
> +
> ++#if defined(LUA_USE_LINUX_NO_READLINE)
> ++#define LUA_USE_POSIX
> ++#define LUA_USE_DLOPEN                /* needs an extra library: -ldl */
> ++#endif
> ++
> +
> + #if defined(LUA_USE_MACOSX)
> + #define LUA_USE_POSIX
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch b/meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
> new file mode 100644
> index 0000000000..a302874d76
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
> @@ -0,0 +1,90 @@
> +From 1e6df25ac28dcd89f0324177bb55019422404b44 Mon Sep 17 00:00:00 2001
> +From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> +Date: Thu, 3 Sep 2020 15:32:17 +0800
> +Subject: [PATCH] Fixed bug: barriers cannot be active during sweep
> +
> +Barriers cannot be active during sweep, even in generational mode.
> +(Although gen. mode is not incremental, it can hit a barrier when
> +deleting a thread and closing its upvalues.)  The colors of objects are
> +being changed during sweep and, therefore, cannot be trusted.
> +
> +Upstream-Status: Backport [https://github.com/lua/lua/commit/a6da1472c0c5e05ff249325f979531ad51533110]
> +CVE: CVE-2020-24371
> +
> +[Adjust code KGC_INC -> KGC_NORMAL, refer 69371c4b84becac09c445aae01d005b49658ef82]
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + src/lgc.c | 33 ++++++++++++++++++++++++---------
> + 1 file changed, 24 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/lgc.c b/src/lgc.c
> +index 973c269..7af23d5 100644
> +--- a/src/lgc.c
> ++++ b/src/lgc.c
> +@@ -142,10 +142,17 @@ static int iscleared (global_State *g, const TValue *o) {
> +
> +
> + /*
> +-** barrier that moves collector forward, that is, mark the white object
> +-** being pointed by a black object. (If in sweep phase, clear the black
> +-** object to white [sweep it] to avoid other barrier calls for this
> +-** same object.)
> ++** Barrier that moves collector forward, that is, marks the white object
> ++** 'v' being pointed by the black object 'o'.  In the generational
> ++** mode, 'v' must also become old, if 'o' is old; however, it cannot
> ++** be changed directly to OLD, because it may still point to non-old
> ++** objects. So, it is marked as OLD0. In the next cycle it will become
> ++** OLD1, and in the next it will finally become OLD (regular old). By
> ++** then, any object it points to will also be old.  If called in the
> ++** incremental sweep phase, it clears the black object to white (sweep
> ++** it) to avoid other barrier calls for this same object. (That cannot
> ++** be done is generational mode, as its sweep does not distinguish
> ++** whites from deads.)
> + */
> + void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
> +   global_State *g = G(L);
> +@@ -154,7 +161,8 @@ void luaC_barrier_ (lua_State *L, GCObject *o, GCObject *v) {
> +     reallymarkobject(g, v);  /* restore invariant */
> +   else {  /* sweep phase */
> +     lua_assert(issweepphase(g));
> +-    makewhite(g, o);  /* mark main obj. as white to avoid other barriers */
> ++    if (g->gckind == KGC_NORMAL)  /* incremental mode? */
> ++      makewhite(g, o);  /* mark 'o' as white to avoid other barriers */
> +   }
> + }
> +
> +@@ -299,10 +307,15 @@ static void markbeingfnz (global_State *g) {
> +
> +
> + /*
> +-** Mark all values stored in marked open upvalues from non-marked threads.
> +-** (Values from marked threads were already marked when traversing the
> +-** thread.) Remove from the list threads that no longer have upvalues and
> +-** not-marked threads.
> ++** For each non-marked thread, simulates a barrier between each open
> ++** upvalue and its value. (If the thread is collected, the value will be
> ++** assigned to the upvalue, but then it can be too late for the barrier
> ++** to act. The "barrier" does not need to check colors: A non-marked
> ++** thread must be young; upvalues cannot be older than their threads; so
> ++** any visited upvalue must be young too.) Also removes the thread from
> ++** the list, as it was already visited. Removes also threads with no
> ++** upvalues, as they have nothing to be checked. (If the thread gets an
> ++** upvalue later, it will be linked in the list again.)
> + */
> + static void remarkupvals (global_State *g) {
> +   lua_State *thread;
> +@@ -313,9 +326,11 @@ static void remarkupvals (global_State *g) {
> +       p = &thread->twups;  /* keep marked thread with upvalues in the list */
> +     else {  /* thread is not marked or without upvalues */
> +       UpVal *uv;
> ++      lua_assert(!isold(thread) || thread->openupval == NULL);
> +       *p = thread->twups;  /* remove thread from the list */
> +       thread->twups = thread;  /* mark that it is out of list */
> +       for (uv = thread->openupval; uv != NULL; uv = uv->u.open.next) {
> ++        lua_assert(getage(uv) <= getage(thread));
> +         if (uv->u.open.touched) {
> +           markvalue(g, uv->v);  /* remark upvalue's value */
> +           uv->u.open.touched = 0;
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/lua/lua/CVE-2020-15888.patch b/meta/recipes-devtools/lua/lua/CVE-2020-15888.patch
> new file mode 100644
> index 0000000000..60a4125971
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/CVE-2020-15888.patch
> @@ -0,0 +1,45 @@
> +From 6298903e35217ab69c279056f925fb72900ce0b7 Mon Sep 17 00:00:00 2001
> +From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> +Date: Mon, 6 Jul 2020 12:11:54 -0300
> +Subject: [PATCH] Keep minimum size when shrinking a stack
> +
> +When shrinking a stack (during GC), do not make it smaller than the
> +initial stack size.
> +---
> + ldo.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +==== end of original header ====
> +
> +CVE: CVE-2020-15888
> +
> +Upstream-Status: backport [https://github.com/lua/lua.git]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +====
> +diff --git a/ldo.c b/ldo.c
> +index c563b1d9..a89ac010 100644
> +--- a/src/ldo.c
> ++++ b/src/ldo.c
> +@@ -220,7 +220,7 @@ static int stackinuse (lua_State *L) {
> +
> + void luaD_shrinkstack (lua_State *L) {
> +   int inuse = stackinuse(L);
> +-  int goodsize = inuse + (inuse / 8) + 2*EXTRA_STACK;
> ++  int goodsize = inuse + BASIC_STACK_SIZE;
> +   if (goodsize > LUAI_MAXSTACK)
> +     goodsize = LUAI_MAXSTACK;  /* respect stack limit */
> +   if (L->stacksize > LUAI_MAXSTACK)  /* had been handling stack overflow? */
> +@@ -229,8 +229,7 @@ void luaD_shrinkstack (lua_State *L) {
> +     luaE_shrinkCI(L);  /* shrink list */
> +   /* if thread is currently not handling a stack overflow and its
> +      good size is smaller than current size, shrink its stack */
> +-  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) &&
> +-      goodsize < L->stacksize)
> ++  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) && goodsize < L->stacksize)
> +     luaD_reallocstack(L, goodsize);
> +   else  /* don't change stack */
> +     condmovestack(L,{},{});  /* (change only for debugging) */
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/lua/lua/CVE-2020-15945.patch b/meta/recipes-devtools/lua/lua/CVE-2020-15945.patch
> new file mode 100644
> index 0000000000..89ce491487
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/CVE-2020-15945.patch
> @@ -0,0 +1,167 @@
> +From d8d344365945a534f700c82c5dd26f704f89fef3 Mon Sep 17 00:00:00 2001
> +From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> +Date: Wed, 5 Aug 2020 16:59:58 +0800
> +Subject: [PATCH] Fixed bug: invalid 'oldpc' when returning to a function
> +
> +The field 'L->oldpc' is not always updated when control returns to a
> +function; an invalid value can seg. fault when computing 'changedline'.
> +(One example is an error in a finalizer; control can return to
> +'luaV_execute' without executing 'luaD_poscall'.) Instead of trying to
> +fix all possible corner cases, it seems safer to be resilient to invalid
> +values for 'oldpc'. Valid but wrong values at most cause an extra call
> +to a line hook.
> +
> +CVE: CVE-2020-15945
> +
> +[Adjust the code to be applicable to the tree]
> +
> +Upstream-Status: Backport [https://github.com/lua/lua/commit/a2195644d89812e5b157ce7bac35543e06db05e3]
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +Signed-off-by: Joe Slater <joe.slater@@windriver.com>
> +
> +---
> + src/ldebug.c | 30 +++++++++++++++---------------
> + src/ldebug.h |  4 ++++
> + src/ldo.c    |  2 +-
> + src/lstate.c |  1 +
> + src/lstate.h |  2 +-
> + 5 files changed, 22 insertions(+), 17 deletions(-)
> +
> +diff --git a/src/ldebug.c b/src/ldebug.c
> +index 239affb..832b16c 100644
> +--- a/src/ldebug.c
> ++++ b/src/ldebug.c
> +@@ -34,9 +34,8 @@
> + #define noLuaClosure(f)               ((f) == NULL || (f)->c.tt == LUA_TCCL)
> +
> +
> +-/* Active Lua function (given call info) */
> +-#define ci_func(ci)           (clLvalue((ci)->func))
> +-
> ++/* inverse of 'pcRel' */
> ++#define invpcRel(pc, p)                ((p)->code + (pc) + 1)
> +
> + static const char *funcnamefromcode (lua_State *L, CallInfo *ci,
> +                                     const char **name);
> +@@ -71,20 +70,18 @@ static void swapextra (lua_State *L) {
> +
> + /*
> + ** This function can be called asynchronously (e.g. during a signal).
> +-** Fields 'oldpc', 'basehookcount', and 'hookcount' (set by
> +-** 'resethookcount') are for debug only, and it is no problem if they
> +-** get arbitrary values (causes at most one wrong hook call). 'hookmask'
> +-** is an atomic value. We assume that pointers are atomic too (e.g., gcc
> +-** ensures that for all platforms where it runs). Moreover, 'hook' is
> +-** always checked before being called (see 'luaD_hook').
> ++** Fields 'basehookcount' and 'hookcount' (set by 'resethookcount')
> ++** are for debug only, and it is no problem if they get arbitrary
> ++** values (causes at most one wrong hook call). 'hookmask' is an atomic
> ++** value. We assume that pointers are atomic too (e.g., gcc ensures that
> ++** for all platforms where it runs). Moreover, 'hook' is always checked
> ++** before being called (see 'luaD_hook').
> + */
> + LUA_API void lua_sethook (lua_State *L, lua_Hook func, int mask, int count) {
> +   if (func == NULL || mask == 0) {  /* turn off hooks? */
> +     mask = 0;
> +     func = NULL;
> +   }
> +-  if (isLua(L->ci))
> +-    L->oldpc = L->ci->u.l.savedpc;
> +   L->hook = func;
> +   L->basehookcount = count;
> +   resethookcount(L);
> +@@ -665,7 +662,10 @@ l_noret luaG_runerror (lua_State *L, const char *fmt, ...) {
> + void luaG_traceexec (lua_State *L) {
> +   CallInfo *ci = L->ci;
> +   lu_byte mask = L->hookmask;
> ++  const Proto *p = ci_func(ci)->p;
> +   int counthook = (--L->hookcount == 0 && (mask & LUA_MASKCOUNT));
> ++  /* 'L->oldpc' may be invalid; reset it in this case */
> ++  int oldpc = (L->oldpc < p->sizecode) ? L->oldpc : 0;
> +   if (counthook)
> +     resethookcount(L);  /* reset count */
> +   else if (!(mask & LUA_MASKLINE))
> +@@ -677,15 +677,15 @@ void luaG_traceexec (lua_State *L) {
> +   if (counthook)
> +     luaD_hook(L, LUA_HOOKCOUNT, -1);  /* call count hook */
> +   if (mask & LUA_MASKLINE) {
> +-    Proto *p = ci_func(ci)->p;
> +     int npc = pcRel(ci->u.l.savedpc, p);
> +     int newline = getfuncline(p, npc);
> +     if (npc == 0 ||  /* call linehook when enter a new function, */
> +-        ci->u.l.savedpc <= L->oldpc ||  /* when jump back (loop), or when */
> +-        newline != getfuncline(p, pcRel(L->oldpc, p)))  /* enter a new line */
> ++        ci->u.l.savedpc <= invpcRel(oldpc, p) ||  /* when jump back (loop), or when */
> ++        newline != getfuncline(p, oldpc))  /* enter a new line */
> +       luaD_hook(L, LUA_HOOKLINE, newline);  /* call line hook */
> ++
> ++    L->oldpc = npc;  /* 'pc' of last call to line hook */
> +   }
> +-  L->oldpc = ci->u.l.savedpc;
> +   if (L->status == LUA_YIELD) {  /* did hook yield? */
> +     if (counthook)
> +       L->hookcount = 1;  /* undo decrement to zero */
> +diff --git a/src/ldebug.h b/src/ldebug.h
> +index 0e31546..c224cc4 100644
> +--- a/src/ldebug.h
> ++++ b/src/ldebug.h
> +@@ -13,6 +13,10 @@
> +
> + #define pcRel(pc, p)  (cast(int, (pc) - (p)->code) - 1)
> +
> ++/* Active Lua function (given call info) */
> ++#define ci_func(ci)            (clLvalue((ci)->func))
> ++
> ++
> + #define getfuncline(f,pc)     (((f)->lineinfo) ? (f)->lineinfo[pc] : -1)
> +
> + #define resethookcount(L)     (L->hookcount = L->basehookcount)
> +diff --git a/src/ldo.c b/src/ldo.c
> +index 90b695f..f66ac1a 100644
> +--- a/src/ldo.c
> ++++ b/src/ldo.c
> +@@ -382,7 +382,7 @@ int luaD_poscall (lua_State *L, CallInfo *ci, StkId firstResult, int nres) {
> +       luaD_hook(L, LUA_HOOKRET, -1);
> +       firstResult = restorestack(L, fr);
> +     }
> +-    L->oldpc = ci->previous->u.l.savedpc;  /* 'oldpc' for caller function */
> ++    L->oldpc = pcRel(ci->u.l.savedpc, ci_func(ci)->p);  /* 'oldpc' for caller function */
> +   }
> +   res = ci->func;  /* res == final position of 1st result */
> +   L->ci = ci->previous;  /* back to caller */
> +diff --git a/src/lstate.c b/src/lstate.c
> +index 9194ac3..3573e36 100644
> +--- a/src/lstate.c
> ++++ b/src/lstate.c
> +@@ -236,6 +236,7 @@ static void preinit_thread (lua_State *L, global_State *g) {
> +   L->nny = 1;
> +   L->status = LUA_OK;
> +   L->errfunc = 0;
> ++  L->oldpc = 0;
> + }
> +
> +
> +diff --git a/src/lstate.h b/src/lstate.h
> +index a469466..d75eadf 100644
> +--- a/src/lstate.h
> ++++ b/src/lstate.h
> +@@ -164,7 +164,6 @@ struct lua_State {
> +   StkId top;  /* first free slot in the stack */
> +   global_State *l_G;
> +   CallInfo *ci;  /* call info for current function */
> +-  const Instruction *oldpc;  /* last pc traced */
> +   StkId stack_last;  /* last free slot in the stack */
> +   StkId stack;  /* stack base */
> +   UpVal *openupval;  /* list of open upvalues in this stack */
> +@@ -174,6 +173,7 @@ struct lua_State {
> +   CallInfo base_ci;  /* CallInfo for first level (C calling Lua) */
> +   volatile lua_Hook hook;
> +   ptrdiff_t errfunc;  /* current error handling function (stack index) */
> ++  int oldpc;  /* last pc traced */
> +   int stacksize;
> +   int basehookcount;
> +   int hookcount;
> +--
> +2.13.3
> +
> diff --git a/meta/recipes-devtools/lua/lua/lua.pc.in b/meta/recipes-devtools/lua/lua/lua.pc.in
> new file mode 100644
> index 0000000000..c27e86e85d
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/lua.pc.in
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +libdir=${prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: Lua
> +Description: Lua language engine
> +Version: @VERSION@
> +Requires:
> +Libs: -L${libdir} -llua -lm -ldl
> +Cflags: -I${includedir}
> diff --git a/meta/recipes-devtools/lua/lua/run-ptest b/meta/recipes-devtools/lua/lua/run-ptest
> new file mode 100644
> index 0000000000..8e085e1af9
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +cd test
> +lua -e"_U=true" all.lua > lua-test.tmp
> +
> +echo "--- test output ---"
> +cat lua-test.tmp
> +echo ""
> +echo ""
> +echo "--- ptest result ---"
> +
> +grep "final OK \!\!\!" lua-test.tmp > /dev/null
> +if [ $? -eq 0 ]; then
> +   echo "PASS: lua"
> +else
> +   echo "FAIL: lua"
> +fi
> +
> +rm -f lua-test.tmp
> diff --git a/meta/recipes-devtools/lua/lua_5.3.6.bb b/meta/recipes-devtools/lua/lua_5.3.6.bb
> new file mode 100644
> index 0000000000..f830e09259
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua_5.3.6.bb
> @@ -0,0 +1,67 @@
> +DESCRIPTION = "Lua is a powerful light-weight programming language designed \
> +for extending applications."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=f43d8ee6bc4df18ef8b276439cc4a153"
> +HOMEPAGE = "http://www.lua.org/"
> +
> +SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
> +           file://lua.pc.in \
> +           file://0001-Allow-building-lua-without-readline-on-Linux.patch \
> +           file://CVE-2020-15888.patch \
> +           file://CVE-2020-15945.patch \
> +           file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
> +           "
> +
> +# if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
> +PV_testsuites = "5.3.4"
> +
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
> +           'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest \
> +            file://run-ptest \
> +           ', '', d)}"
> +
> +SRC_URI[tarballsrc.md5sum] = "83f23dbd5230140a3770d5f54076948d"
> +SRC_URI[tarballsrc.sha256sum] = "fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
> +SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
> +SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
> +
> +inherit pkgconfig binconfig ptest
> +
> +PACKAGECONFIG ??= "readline"
> +PACKAGECONFIG[readline] = ",,readline"
> +
> +TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
> +EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"
> +
> +do_configure:prepend() {
> +    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
> +    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
> +}
> +
> +do_compile () {
> +    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux', 'linux-no-readline', d)}
> +}
> +
> +do_install () {
> +    oe_runmake \
> +        'INSTALL_TOP=${D}${prefix}' \
> +        'INSTALL_BIN=${D}${bindir}' \
> +        'INSTALL_INC=${D}${includedir}/' \
> +        'INSTALL_MAN=${D}${mandir}/man1' \
> +        'INSTALL_SHARE=${D}${datadir}/lua' \
> +        'INSTALL_LIB=${D}${libdir}' \
> +        'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
> +        install
> +    install -d ${D}${libdir}/pkgconfig
> +
> +    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
> +    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
> +    rmdir ${D}${datadir}/lua/5.3
> +    rmdir ${D}${datadir}/lua
> +}
> +
> +do_install_ptest () {
> +        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.31.1
>
>
> 
>
