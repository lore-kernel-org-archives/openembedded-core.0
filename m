Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QIBxh-0006r9-JP
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 05:44:17 +0200
Received: by ywg8 with SMTP id 8so1116102ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=5NmWef76KgnrdkNjQnR3wlL16W/xTV+hhxgcBugfSNY=;
	b=UYL5CHV9ADusBu8608s4EgM5kOudok83H+9V8zaXenKsCYe2awea0k8A1dWMoByPBC
	hTvCtx+e9dwDXS7g1yodC3x2+Nw+/xoP4vqTrHOqlf3fC13YP8NCy643xLQVC1gin9DU
	Vh309+gIRXBCJJfD2rCb2pbtkDFkeJkY0/1g8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=q6Yego2jZA59NsI2u3fBxfT1JRMCJ7jmh1MMd4n05OIVb1zbSRh4U/Bt9nshVqmaCp
	G9Jg1qe/zdr5cdebY92R7tlUMbJ/eSt4bXrGkd0ISIj8yByJ2QAPtRXv6dEJgnaS77qI
	VB2+mKHh6+bsxrVZ4XDgzF/fAVsTf8VgctamQ=
MIME-Version: 1.0
Received: by 10.91.4.19 with SMTP id g19mr2851474agi.193.1304653295463; Thu,
	05 May 2011 20:41:35 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Thu, 5 May 2011 20:41:35 -0700 (PDT)
In-Reply-To: <c1791b09971fb5d6576b60a0231fe02412d6fef7.1304652773.git.nitin.a.kamble@intel.com>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
	<c1791b09971fb5d6576b60a0231fe02412d6fef7.1304652773.git.nitin.a.kamble@intel.com>
Date: Thu, 5 May 2011 23:41:35 -0400
Message-ID: <BANLkTimR++6PYBnDcJg8_aG+kw_bMnH-Jw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 07/10] linux-yocto_git.bb: Backport upstream fix for gcc 4.6 compilation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2011 03:44:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2011 at 11:36 PM, Nitin A Kamble
<nitin.a.kamble@intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>

This has already been merged into the kernel tree itself, so can
be dropped from this series.

Bruce

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0.../perf-tool-Fix-gcc-4.6.0-issues.patch =A0 =A0 =A0 =A0 =A0 | =A0266 =
++++++++++++++++++++
> =A0meta/recipes-kernel/linux/linux-yocto_git.bb =A0 =A0 =A0 | =A0 =A04 +-
> =A02 files changed, 269 insertions(+), 1 deletions(-)
> =A0create mode 100644 meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix=
-gcc-4.6.0-issues.patch
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.=
0-issues.patch b/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.=
6.0-issues.patch
> new file mode 100644
> index 0000000..c3510ad
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issue=
s.patch
> @@ -0,0 +1,266 @@
> +Backported to linux-yocto kernel git version
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +
> +From patchwork Tue Apr 19 20:09:19 2011
> +Content-Type: text/plain; charset=3D"utf-8"
> +MIME-Version: 1.0
> +Content-Transfer-Encoding: 7bit
> +Subject: [70/70] perf tool: Fix gcc 4.6.0 issues
> +Date: Tue, 19 Apr 2011 20:09:19 -0000
> +From: Greg Kroah-Hartman <gregkh@suse.de>
> +X-Patchwork-Id: 719212
> +Message-Id: <20110419201050.665258193@clark.kroah.org>
> +To: linux-kernel@vger.kernel.org, stable@kernel.org
> +Cc: stable-review@kernel.org, torvalds@linux-foundation.org,
> + akpm@linux-foundation.org, alan@lxorguk.ukuu.org.uk,
> + Ingo Molnar <mingo@redhat.com>, Kyle McMartin <kyle@redhat.com>,
> + Arnaldo Carvalho de Melo <acme@redhat.com>, Thomas Meyer <thomas@m3y3r.=
de>
> +
> +2.6.38-stable review patch. =A0If anyone has any objections, please let =
us know.
> +
> +------------------
> +
> +From: Kyle McMartin <kyle@mcmartin.ca>
> +
> +commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.
> +
> +GCC 4.6.0 in Fedora rawhide turned up some compile errors in tools/perf
> +due to the -Werror=3Dunused-but-set-variable flag.
> +
> +I've gone through and annotated some of the assignments that had side
> +effects (ie: return value from a function) with the __used annotation,
> +and in some cases, just removed unused code.
> +
> +In a few cases, we were assigning something useful, but not using it in
> +later parts of the function.
> +
> +kyle@dreadnought:~/src% gcc --version
> +gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)
> +
> +Cc: Ingo Molnar <mingo@redhat.com>
> +LKML-Reference: <20110124161304.GK27353@bombadil.infradead.org>
> +Signed-off-by: Kyle McMartin <kyle@redhat.com>
> +[ committer note: Fixed up the annotation fixes, as that code moved rece=
ntly ]
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +[Backported to 2.6.38.2 by deleting unused but set variables]
> +Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> +
> +---
> +tools/perf/bench/sched-pipe.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-
> + tools/perf/builtin-sched.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 12 +++---------
> + tools/perf/builtin-top.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A05 +----
> + tools/perf/util/header.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A02 +-
> + tools/perf/util/hist.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A03 ---
> + tools/perf/util/scripting-engines/trace-event-python.c | =A0 =A03 +--
> + tools/perf/util/symbol.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A04 ++--
> + tools/perf/util/trace-event-parse.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A02 +-
> + tools/perf/util/ui/browsers/map.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
> + 9 files changed, 11 insertions(+), 24 deletions(-)
> +
> +
> +
> +--
> +To unsubscribe from this list: send the line "unsubscribe linux-kernel" =
in
> +the body of a message to majordomo@vger.kernel.org
> +More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> +Please read the FAQ at =A0http://www.tux.org/lkml/
> +
> +Index: linux/tools/perf/bench/sched-pipe.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/bench/sched-pipe.c
> ++++ linux/tools/perf/bench/sched-pipe.c
> +@@ -55,7 +55,7 @@ int bench_sched_pipe(int argc, const cha
> + =A0 =A0 =A0 =A0* discarding returned value of read(), write()
> + =A0 =A0 =A0 =A0* causes error in building environment for perf
> + =A0 =A0 =A0 =A0*/
> +- =A0 =A0 =A0int ret, wait_stat;
> ++ =A0 =A0 =A0int __used ret, wait_stat;
> + =A0 =A0 =A0 pid_t pid, retpid;
> +
> + =A0 =A0 =A0 argc =3D parse_options(argc, argv, options,
> +Index: linux/tools/perf/builtin-sched.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/builtin-sched.c
> ++++ linux/tools/perf/builtin-sched.c
> +@@ -369,11 +369,6 @@ static void
> + process_sched_event(struct task_desc *this_task __used, struct sched_at=
om *atom)
> + {
> + =A0 =A0 =A0 int ret =3D 0;
> +- =A0 =A0 =A0u64 now;
> +- =A0 =A0 =A0long long delta;
> +-
> +- =A0 =A0 =A0now =3D get_nsecs();
> +- =A0 =A0 =A0delta =3D start_time + atom->timestamp - now;
> +
> + =A0 =A0 =A0 switch (atom->type) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case SCHED_EVENT_RUN:
> +@@ -561,7 +556,7 @@ static void wait_for_tasks(void)
> +
> + static void run_one_test(void)
> + {
> +- =A0 =A0 =A0u64 T0, T1, delta, avg_delta, fluct, std_dev;
> ++ =A0 =A0 =A0u64 T0, T1, delta, avg_delta, fluct;
> +
> + =A0 =A0 =A0 T0 =3D get_nsecs();
> + =A0 =A0 =A0 wait_for_tasks();
> +@@ -577,7 +572,6 @@ static void run_one_test(void)
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fluct =3D delta - avg_delta;
> + =A0 =A0 =A0 sum_fluct +=3D fluct;
> +- =A0 =A0 =A0std_dev =3D sum_fluct / nr_runs / sqrt(nr_runs);
> + =A0 =A0 =A0 if (!run_avg)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 run_avg =3D delta;
> + =A0 =A0 =A0 run_avg =3D (run_avg*9 + delta)/10;
> +@@ -798,7 +792,7 @@ replay_switch_event(struct trace_switch_
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u64 timestamp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct thread *thread __used)
> + {
> +- =A0 =A0 =A0struct task_desc *prev, *next;
> ++ =A0 =A0 =A0struct task_desc *prev, __used *next;
> + =A0 =A0 =A0 u64 timestamp0;
> + =A0 =A0 =A0 s64 delta;
> +
> +@@ -1403,7 +1397,7 @@ map_switch_event(struct trace_switch_eve
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u64 timestamp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct thread *thread __used)
> + {
> +- =A0 =A0 =A0struct thread *sched_out, *sched_in;
> ++ =A0 =A0 =A0struct thread *sched_out __used, *sched_in;
> + =A0 =A0 =A0 int new_shortname;
> + =A0 =A0 =A0 u64 timestamp0;
> + =A0 =A0 =A0 s64 delta;
> +Index: linux/tools/perf/builtin-top.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/builtin-top.c
> ++++ linux/tools/perf/builtin-top.c
> +@@ -180,7 +180,6 @@ static int parse_source(struct sym_entry
> + =A0 =A0 =A0 FILE *file;
> + =A0 =A0 =A0 char command[PATH_MAX*2];
> + =A0 =A0 =A0 const char *path;
> +- =A0 =A0 =A0u64 len;
> +
> + =A0 =A0 =A0 if (!syme)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> +@@ -209,8 +208,6 @@ static int parse_source(struct sym_entry
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 path =3D map->dso->long_name;
> +
> +- =A0 =A0 =A0len =3D sym->end - sym->start;
> +-
> + =A0 =A0 =A0 sprintf(command,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "objdump --start-address=3D%#0*Lx --stop-ad=
dress=3D%#0*Lx -dS %s",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BITS_PER_LONG / 4, map__rip_2objdump(map, s=
ym->start),
> +@@ -1263,7 +1260,7 @@ static int __cmd_top(void)
> + {
> + =A0 =A0 =A0 pthread_t thread;
> + =A0 =A0 =A0 int i, counter;
> +- =A0 =A0 =A0int ret;
> ++ =A0 =A0 =A0int ret __used;
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* FIXME: perf_session__new should allow passing a O_MMAP=
, so that all this
> + =A0 =A0 =A0 =A0* mmap reading, etc is encapsulated in it. Use O_WRONLY =
for now.
> +Index: linux/tools/perf/util/header.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/util/header.c
> ++++ linux/tools/perf/util/header.c
> +@@ -1113,7 +1113,7 @@ int event__synthesize_tracing_data(int f
> + {
> + =A0 =A0 =A0 event_t ev;
> + =A0 =A0 =A0 ssize_t size =3D 0, aligned_size =3D 0, padding;
> +- =A0 =A0 =A0int err =3D 0;
> ++ =A0 =A0 =A0int err __used =3D 0;
> +
> + =A0 =A0 =A0 memset(&ev, 0, sizeof(ev));
> +
> +Index: linux/tools/perf/util/hist.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/util/hist.c
> ++++ linux/tools/perf/util/hist.c
> +@@ -1091,7 +1091,6 @@ int hist_entry__annotate(struct hist_ent
> + =A0 =A0 =A0 char command[PATH_MAX * 2];
> + =A0 =A0 =A0 FILE *file;
> + =A0 =A0 =A0 int err =3D 0;
> +- =A0 =A0 =A0u64 len;
> +
> + =A0 =A0 =A0 if (filename =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dso->has_build_id) {
> +@@ -1128,8 +1127,6 @@ fallback:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0filename, sym->name, map->unmap_ip(map, =
sym->start),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0map->unmap_ip(map, sym->end));
> +
> +- =A0 =A0 =A0len =3D sym->end - sym->start;
> +-
> + =A0 =A0 =A0 pr_debug("annotating [%p] %30s : [%p] %30s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dso, dso->long_name, sym, sym->name);
> +
> +Index: linux/tools/perf/util/scripting-engines/trace-event-python.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/util/scripting-engines/trace-event-python.c
> ++++ linux/tools/perf/util/scripting-engines/trace-event-python.c
> +@@ -248,8 +248,7 @@ static void python_process_event(int cpu
> + =A0 =A0 =A0 context =3D PyCObject_FromVoidPtr(scripting_context, NULL);
> +
> + =A0 =A0 =A0 PyTuple_SetItem(t, n++, PyString_FromString(handler_name));
> +- =A0 =A0 =A0PyTuple_SetItem(t, n++,
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PyCObject_FromVoidPtr(scrip=
ting_context, NULL));
> ++ =A0 =A0 =A0PyTuple_SetItem(t, n++, context);
> +
> + =A0 =A0 =A0 if (handler) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 PyTuple_SetItem(t, n++, PyInt_FromLong(cpu)=
);
> +Index: linux/tools/perf/util/symbol.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/util/symbol.c
> ++++ linux/tools/perf/util/symbol.c
> +@@ -1481,8 +1481,8 @@ int dso__load(struct dso *self, struct m
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 snprintf(name, size, "%s", =
self->long_name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case DSO__ORIG_GUEST_KMODULE:
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (map->groups && map->gro=
ups->machine)
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0root_dir =
=3D map->groups->machine->root_dir;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (map->groups && machine)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0root_dir =
=3D machine->root_dir;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 root_dir =
=3D "";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 snprintf(name, size, "%s%s"=
, root_dir, self->long_name);
> +Index: linux/tools/perf/util/trace-event-parse.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/util/trace-event-parse.c
> ++++ linux/tools/perf/util/trace-event-parse.c
> +@@ -153,7 +153,7 @@ void parse_proc_kallsyms(char *file, uns
> + =A0 =A0 =A0 char *next =3D NULL;
> + =A0 =A0 =A0 char *addr_str;
> + =A0 =A0 =A0 char ch;
> +- =A0 =A0 =A0int ret;
> ++ =A0 =A0 =A0int ret __used;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 line =3D strtok_r(file, "\n", &next);
> +Index: linux/tools/perf/util/ui/browsers/map.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/util/ui/browsers/map.c
> ++++ linux/tools/perf/util/ui/browsers/map.c
> +@@ -40,7 +40,7 @@ static int ui_entry__read(const char *ti
> + out_free_form:
> + =A0 =A0 =A0 newtPopWindow();
> + =A0 =A0 =A0 newtFormDestroy(form);
> +- =A0 =A0 =A0return 0;
> ++ =A0 =A0 =A0return err;
> + }
> +
> + struct map_browser {
> +Index: linux/tools/perf/builtin-stat.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- linux.orig/tools/perf/builtin-stat.c
> ++++ linux/tools/perf/builtin-stat.c
> +@@ -211,7 +211,7 @@ static void read_counter(int counter)
> + =A0 =A0 =A0 u64 count[3], single_count[3];
> + =A0 =A0 =A0 int cpu;
> + =A0 =A0 =A0 size_t res, nv;
> +- =A0 =A0 =A0int scaled;
> ++ =A0 =A0 =A0int scaled __used;
> + =A0 =A0 =A0 int i, thread;
> +
> + =A0 =A0 =A0 count[0] =3D count[1] =3D count[2] =3D 0;
> diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-=
kernel/linux/linux-yocto_git.bb
> index 3b4e77e..e08d2df 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_git.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
> @@ -35,7 +35,9 @@ PR =3D "r17"
> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =A0SRCREV_FORMAT =3D "meta_machine"
>
> -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3Dgi=
t;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
> +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3Dgi=
t;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta \
> + =A0 =A0 =A0 =A0 =A0 file://perf-tool-Fix-gcc-4.6.0-issues.patch \
> + =A0 =A0 =A0 =A0 =A0"
>
> =A0COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|m=
pc8315e-rdb|routerstationpro|beagleboard)"
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


