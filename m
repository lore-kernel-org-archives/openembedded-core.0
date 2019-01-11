Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F82E7C148
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 15:50:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0BFntOe019393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jan 2019 07:50:05 -0800
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 11 Jan 2019 07:49:44 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190111104349.33960-1-alex.kanavin@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <92392218-ceb5-7166-7bb1-64127b46df41@windriver.com>
Date: Fri, 11 Jan 2019 09:49:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111104349.33960-1-alex.kanavin@gmail.com>
Subject: Re: [PATCH] rpm: produce sane amount of logging when creating a rootfs
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
X-List-Received-Date: Fri, 11 Jan 2019 15:50:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'm slightly worried that this will break on-target RPM users.  Since info is
commonly enabled during on-target installations to track which packages have
been installed and what their progress is.

Has it been test that this does not break dnf on the target?

--Mark

On 1/11/19 4:43 AM, Alexander Kanavin wrote:
> Previously there was lots of irrelevant noise in the logs,
> because we also wanted to be able to debug postinst issues
> easily. I have adjusted the logging levels so that
> postinst info is still written to the logs, but other
> things are not.
> 
> [YOCTO #13119]
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oe/package_manager.py                |  2 +-
>  ...ge-logging-level-around-scriptlets-t.patch | 55 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
>  3 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 392fe7e3724..7ff76c61cdd 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -966,7 +966,7 @@ class RpmPM(PackageManager):
>          os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
>  
>          dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
> -        standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
> +        standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
>                               "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
>                               "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
>                               "--installroot=%s" % (self.target_rootfs),
> diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
> new file mode 100644
> index 00000000000..43e9859ef32
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
> @@ -0,0 +1,55 @@
> +From 989e425d416474c191b020d0825895e3df4bd033 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 10 Jan 2019 18:14:18 +0100
> +Subject: [PATCH] rpmscript.c: change logging level around scriptlets to INFO
> + from DEBUG
> +
> +That way we can debug scriptlet failures without writing lots of
> +irrelevant noise to rootfs logs.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + lib/rpmscript.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> +index 2b0e43862..e319673f1 100644
> +--- a/lib/rpmscript.c
> ++++ b/lib/rpmscript.c
> +@@ -226,7 +226,7 @@ static char * writeScript(const char *cmd, const char *script)
> +     if (Ferror(fd))
> + 	goto exit;
> + 
> +-    if (rpmIsDebug() && (rstreq(cmd, "/bin/sh") || rstreq(cmd, "/bin/bash"))) {
> ++    if (rpmIsVerbose() && (rstreq(cmd, "/bin/sh") || rstreq(cmd, "/bin/bash"))) {
> + 	static const char set_x[] = "set -x\n";
> + 	/* Assume failures will be caught by the write below */
> + 	Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> +@@ -258,7 +258,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
> +     char *mline = NULL;
> +     rpmRC rc = RPMRC_FAIL;
> + 
> +-    rpmlog(RPMLOG_DEBUG, "%s: scriptlet start\n", sname);
> ++    rpmlog(RPMLOG_INFO, "%s: scriptlet start\n", sname);
> + 
> +     if (script) {
> + 	fn = writeScript(*argvp[0], script);
> +@@ -310,7 +310,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
> + 		sname, strerror(errno));
> + 	goto exit;
> +     } else if (pid == 0) {/* Child */
> +-	rpmlog(RPMLOG_DEBUG, "%s: execv(%s) pid %d\n",
> ++	rpmlog(RPMLOG_INFO, "%s: execv(%s) pid %d\n",
> + 	       sname, *argvp[0], (unsigned)getpid());
> + 
> + 	fclose(in);
> +@@ -353,7 +353,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
> + 	reaped = waitpid(pid, &status, 0);
> +     } while (reaped == -1 && errno == EINTR);
> + 
> +-    rpmlog(RPMLOG_DEBUG, "%s: waitpid(%d) rc %d status %x\n",
> ++    rpmlog(RPMLOG_INFO, "%s: waitpid(%d) rc %d status %x\n",
> + 	   sname, (unsigned)pid, (unsigned)reaped, status);
> + 
> +     if (reaped < 0) {
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> index ef5d631917c..66eef557dfa 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
>             file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
>             file://0001-perl-disable-auto-reqs.patch \
>             file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
> +           file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
>             "
>  
>  PE = "1"
> 


