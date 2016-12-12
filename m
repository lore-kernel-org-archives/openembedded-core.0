Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2649A6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 09:54:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g23so10103028wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 01:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j8rCGXVMa+x/GntpzYVn0A9M7Ny1AW2BkMV8hm+fuT8=;
	b=dGmIiPCTwqoY/PagAHFdWOTvWBWuaADD3ZUBvRQ6D5kfPyukD2ijTk0ryj1q6SBONV
	+ilCB3wWkBH0//haSwmPTkY+Mvy+V5YdDIYO5c4n9EgsYP526j/l5pULlLjkCvPXNyqr
	md0tLVha22+9WUJcCCvqnFHotjg/uIHLKOmviJJlEW+of14U07ReVs8I2CtIYgoHYLPd
	djnfz6EJWBb1ErCt2P7n2W3XZqbjTTMArrUt++bQvAo22Jeu/PZdsZW3oZjwRPZzi2yh
	XjXvFb0pNgCKyveqMTClK0/Bw3GnPa0Glvjsi7eWU+DoE/Kb71BL4KMXQlvc6VI5yIvm
	gFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j8rCGXVMa+x/GntpzYVn0A9M7Ny1AW2BkMV8hm+fuT8=;
	b=QoQ+bbw/hamalOdZxcs2V6fipjCCWyNVGQ5YYhGPapajXZGOKxG1uizcm+raj+FHwa
	omh70pbq1NWorEBJJMVrrnxENS5NG3epKA7KrPDb4jcefxAOYnx7M9LyjHJTBPD//IDJ
	DDB4Av3Emet5gu74uhCerSFLXfCcFodr0sCr/bxaa2+/ye+thyDrq5+IWEG5yXAMsDQq
	WD8rkmkrjovvQHkD4BoI8hPVqotX3HdKSu06/dg09Ls31UP2UL40at1sW34SQLob2kvi
	xuZLGMVnHNF80hwvhwi/YeZnhb6p7LwV4Te3fOwRbtpS9MBv+Ct4UtOcuRO27UcH5TzL
	6GCw==
X-Gm-Message-State: AKaTC02mJ23+A+tjhfgtUNEH4Csm/Qe12RhWME7zvmSnCXead5mN8jQ+85zGzmTMXWFTwZlKhmahrcMa19zugA==
X-Received: by 10.28.144.70 with SMTP id s67mr16050504wmd.138.1481536480445;
	Mon, 12 Dec 2016 01:54:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 12 Dec 2016 01:54:39 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 12 Dec 2016 01:54:39 -0800
Message-ID: <CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2016 09:54:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 11, 2016 at 11:41 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Monday, December 12, 2016 2:37 PM
>> To: Huang, Jie (Jackie)
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH] glibc: add -fno-builtin-strlen when not using -O2
>>
>> On Sun, Dec 11, 2016 at 9:42 PM,  <jackie.huang@windriver.com> wrote:
>> > From: Jackie Huang <jackie.huang@windriver.com>
>> >
>> > The strlen will be inlined when compile with -O, -O1 or -Os,
>> > so there is no symbol for strlen in ld-linux-x86-64.so.2,
>> > causing a fatal error in valgrind:
>> >
>> > valgrind: Fatal error at startup: a function redirection
>> > valgrind: which is mandatory for this platform-tool combination
>> > valgrind: cannot be set up. Details of the redirection are:
>> > valgrind:
>> > valgrind: A must-be-redirected function
>> > valgrind: whose name matches the pattern: strlen
>> > valgrind: in an object with soname matching: ld-linux-x86-64.so.2
>> >
>> > so add -fno-builtin-strlen when compile with -O, -O1 or -Os.
>>
>> This is a bug in valgrind, I read the same on forums. KDE has proposed a fix
>> https://bugsfiles.kde.org/attachment.cgi?id=82043
>> can you check if this fixes the issue
>
> Thanks, I will check that and change to patch for valgrind if it works.

For reference, here's the patch I've been using. It's a slightly more
generic fix than the one in the KDE bug report.

diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
index 7e4df8d..640a346 100644
--- a/coregrind/m_redir.c
+++ b/coregrind/m_redir.c
@@ -1220,7 +1220,18 @@ static void add_hardwired_spec (const  HChar*
sopatt, const HChar* fnpatt,
    spec->from_fnpatt = CONST_CAST(HChar *,fnpatt);
    spec->to_addr     = to_addr;
    spec->isWrap      = False;
-   spec->mandatory   = mandatory;
+
+   /* Hack: Depending on how glibc was compiled (e.g. optimised for size or
+      built with _FORTIFY_SOURCE enabled) the strlen symbol might not be found.
+      Therefore although we should still try to intercept it, don't make it
+      mandatory to do so. We over-ride "mandatory" here to avoid the need to
+      patch the many different architecture specific callers to
+      add_hardwired_spec(). */
+   if (0==VG_(strcmp)("strlen", fnpatt))
+      spec->mandatory = NULL;
+   else
+      spec->mandatory = mandatory;
+
    /* VARIABLE PARTS */
    spec->mark        = False; /* not significant */
    spec->done        = False; /* not significant */

