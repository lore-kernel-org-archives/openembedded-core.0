Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35DAC731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:38:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C2cpbg014441
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Jan 2016 18:38:51 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 18:38:50 -0800
Message-ID: <56946709.8080805@windriver.com>
Date: Tue, 12 Jan 2016 10:38:01 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>	<f0764a042c923ae4be18160a550873524df057dd.1452472146.git.hongxu.jia@windriver.com>	<56945377.8090400@windriver.com>
	<A9378EF7-4AEB-481E-B110-FE1B872BE173@gmail.com>
In-Reply-To: <A9378EF7-4AEB-481E-B110-FE1B872BE173@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] pax-utils: 1.0.5 -> 1.1.4
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
X-List-Received-Date: Tue, 12 Jan 2016 02:38:52 -0000
Content-Type: multipart/alternative;
	boundary="------------040402000500040503080507"

--------------040402000500040503080507
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2016 09:22 AM, Khem Raj wrote:
>> On Jan 11, 2016, at 5:14 PM, Randy MacLeod <randy.macleod@windriver.com> wrote:
>>
>> On 2016-01-10 07:30 PM, Hongxu Jia wrote:
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   .../pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb}              | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>   rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb} (83%)
>>>
>>> diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
>>> similarity index 83%
>>> rename from meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
>>> rename to meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
>>> index 0716a08..6c96780 100644
>>> --- a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
>>> +++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
>>> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>>>
>>>   SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
>>>
>>> -SRC_URI[md5sum] = "d731f5385682a7a62ee2e7b7dacc13a7"
>>> -SRC_URI[sha256sum] = "f69a9938e4af7912d26d585094bc0203e43571a990fdd048319088a8b8ad906f"
>>> +SRC_URI[md5sum] = "1bfbb5237881f0c5e476b2f7ffcc00d5"
>>> +SRC_URI[sha256sum] = "796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414"
>>>
>>>   RDEPENDS_${PN} += "bash python"
>>>
>> FYI,
>>
>> This looked like it might be a significant upgrade but
>> I checked it out and it's not that big a deal as shown below.
> it seems to indicate that it will use pkg-config to detect libcap
> but the dependency is floating as recipe doesnt express this either
> using DEPENDS or some other exclusion logic if this dep is to be disabled by default.

Yes, we also need to do the same thing on libseccomp.

Refer gentoo's recipe, we should do the same thing for yocto:
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=5c9396479e32f6d1034a8ccd3b1bd0e8fab8395b

>> I like to see a diffstat and if present a ChangeLog diff
>> on package uprev. Do people think that's worthwhile
>> so that there's evidence that we've looked at the package
>> changes and thought about the impact to the YP build?
>> Again, in this case, there's no ChangeLog and the commits
>> and diffstat don't reveal interesting new functionality to me
>> at least.
> I think that would be an improvement. A link to diffs on upstream SCM  should be enough too.

For pax-utils, I am afraid there is no Changelog or release note
to introduce the change.

As http://gentoo.osuosl.org/distfiles/ shows, the version jumps very quick
...
pax-utils-1.0.5.tar.xz    2015-07-20 04:15    608K
pax-utils-1.1.tar.xz    2015-08-20 14:48    613K
pax-utils-1.1.1.tar.xz    2015-08-28 06:04    613K
pax-utils-1.1.2.tar.xz    2015-09-12 04:17    613K
pax-utils-1.1.3.tar.xz    2015-09-19 06:27    613K
pax-utils-1.1.4.tar.xz    2015-10-26 04:38    613K
...
And Randy's git diff also shows there was no big change.

//Hongxu

>
>>
>> ../Randy
>>
>>
>> $ git clone git://anongit.gentoo.org/proj/pax-utils.git pax-utils.git
>> $ cd pax-utils.git
>> $ git diff v1.0.5..v1.1.4 | diffstat
>> b/Makefile        |   57 ++++++-----
>> b/Makefile.am     |   52 +++++++++-
>> b/configure.ac    |   18 +++
>> b/dumpelf.c       |    1
>> b/lddtree.py      |    6 -
>> b/lddtree.sh      |   20 +++
>> b/make-tarball.sh |    2
>> b/paxelf.c        |    2
>> b/paxinc.h        |    7 +
>> b/paxmacho.h      |    2
>> b/porting.h       |   23 +++-
>> b/pspax.c         |    4
>> b/scanelf.c       |   81 +++++++++-------
>> b/scanmacho.c     |    5
>> b/security.c      |  272 +++++++++++++++++++++++++++++++++++++++++...+
>> b/security.h      |   29 +++++
>> man/.cvsignore    |    1
>> 17 files changed, 507 insertions(+), 75 deletions(-)
>>
>> $ git log --oneline v1.0.5..v1.1.4 | wc -l
>> 22
>>
>> $ git log --oneline v1.0.5..v1.1.4
>> 353a328 security: whitelist the getcwd syscall
>> a7ec3aa porting: fix android builds
>> 9575f81 security: fix build on systems w/out si_syscall
>> 1f7a936 security: whitelist the futex syscall
>> ee6925b security: whitelist dup syscalls
>> 6fa4f46 security: do not warn when seccomp is disabled in the kernel
>> c39a557 security: whitelist fakeroot syscalls
>> bcb6683 security: add a debug handler for seccomp
>> 9d0a60f build: add plumbing for building w/debug code
>> 6e0e840 security: clean up syscall ifdefs
>> d6fcdb5 security: use seccomp to lock ourselves down
>> bdf41eb security: lock down privs a bit via prctl
>> a743806 security: leverage namespaces to restrict the runtime a bit
>> ef15f60 lddtree.sh: fix interp handling when doing a full listing
>> 5e8a1d4 lddtree.py: fix glob handling w/ld.so.conf
>> 0fccfd9 avoid using \n with warn macros
>> 99f303d build: refresh autotool regen logic for git
>> ce30b2e build: use pkg-config for libcap settings
>> 0afc2cc scanelf: fix memory leak with the -s option
>> 51d892d debug: improve cleanup logic
>> cf37405 build: use pkg-config for libcap settings
>> ca9a45b use __typeof__ instead of typeof to build with stricter standards
>>
>> --
>> # Randy MacLeod. SMTS, Linux, Wind River
>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada, K2K 2W5
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------040402000500040503080507
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/12/2016 09:22 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
      cite="mid:A9378EF7-4AEB-481E-B110-FE1B872BE173@gmail.com"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">On Jan 11, 2016, at 5:14 PM, Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:

On 2016-01-10 07:30 PM, Hongxu Jia wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../pax-utils/{pax-utils_1.0.5.bb =&gt; pax-utils_1.1.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb =&gt; pax-utils_1.1.4.bb} (83%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
similarity index 83%
rename from meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
index 0716a08..6c96780 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=eb723b61539feef013de476e68b5c50a">"file://COPYING;md5=eb723b61539feef013de476e68b5c50a"</a>

 SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz">"http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"</a>

-SRC_URI[md5sum] = "d731f5385682a7a62ee2e7b7dacc13a7"
-SRC_URI[sha256sum] = "f69a9938e4af7912d26d585094bc0203e43571a990fdd048319088a8b8ad906f"
+SRC_URI[md5sum] = "1bfbb5237881f0c5e476b2f7ffcc00d5"
+SRC_URI[sha256sum] = "796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414"

 RDEPENDS_${PN} += "bash python"

</pre>
        </blockquote>
        <pre wrap="">
FYI,

This looked like it might be a significant upgrade but
I checked it out and it's not that big a deal as shown below.
</pre>
      </blockquote>
      <pre wrap="">
it seems to indicate that it will use pkg-config to detect libcap
but the dependency is floating as recipe doesnt express this either
using DEPENDS or some other exclusion logic if this dep is to be disabled by default.
</pre>
    </blockquote>
    <br>
    Yes, we also need to do the same thing on libseccomp.<br>
    <br>
    Refer gentoo's recipe, we should do the same thing for yocto:<br>
<a class="moz-txt-link-freetext" href="https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=5c9396479e32f6d1034a8ccd3b1bd0e8fab8395b">https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=5c9396479e32f6d1034a8ccd3b1bd0e8fab8395b</a><br>
    <br>
    <blockquote
      cite="mid:A9378EF7-4AEB-481E-B110-FE1B872BE173@gmail.com"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">
I like to see a diffstat and if present a ChangeLog diff
on package uprev. Do people think that's worthwhile
so that there's evidence that we've looked at the package
changes and thought about the impact to the YP build?
Again, in this case, there's no ChangeLog and the commits
and diffstat don't reveal interesting new functionality to me
at least.
</pre>
      </blockquote>
      <pre wrap="">
I think that would be an improvement. A link to diffs on upstream SCM  should be enough too.</pre>
    </blockquote>
    <br>
    For pax-utils, I am afraid there is no Changelog or release note<br>
    to introduce the change.<br>
    <br>
    As <a class="moz-txt-link-freetext" href="http://gentoo.osuosl.org/distfiles/">http://gentoo.osuosl.org/distfiles/</a> shows, the version jumps very
    quick<br>
    ...<br>
    pax-utils-1.0.5.tar.xz    2015-07-20 04:15    608K     <br>
    pax-utils-1.1.tar.xz    2015-08-20 14:48    613K     <br>
    pax-utils-1.1.1.tar.xz    2015-08-28 06:04    613K     <br>
    pax-utils-1.1.2.tar.xz    2015-09-12 04:17    613K     <br>
    pax-utils-1.1.3.tar.xz    2015-09-19 06:27    613K     <br>
    pax-utils-1.1.4.tar.xz    2015-10-26 04:38    613K     <br>
    ...<br>
    And Randy's git diff also shows there was no big change.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
      cite="mid:A9378EF7-4AEB-481E-B110-FE1B872BE173@gmail.com"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">

../Randy


$ git clone git://anongit.gentoo.org/proj/pax-utils.git pax-utils.git
$ cd pax-utils.git
$ git diff v1.0.5..v1.1.4 | diffstat
b/Makefile        |   57 ++++++-----
b/Makefile.am     |   52 +++++++++-
b/configure.ac    |   18 +++
b/dumpelf.c       |    1
b/lddtree.py      |    6 -
b/lddtree.sh      |   20 +++
b/make-tarball.sh |    2
b/paxelf.c        |    2
b/paxinc.h        |    7 +
b/paxmacho.h      |    2
b/porting.h       |   23 +++-
b/pspax.c         |    4
b/scanelf.c       |   81 +++++++++-------
b/scanmacho.c     |    5
b/security.c      |  272 +++++++++++++++++++++++++++++++++++++++++...+
b/security.h      |   29 +++++
man/.cvsignore    |    1
17 files changed, 507 insertions(+), 75 deletions(-)

$ git log --oneline v1.0.5..v1.1.4 | wc -l
22

$ git log --oneline v1.0.5..v1.1.4
353a328 security: whitelist the getcwd syscall
a7ec3aa porting: fix android builds
9575f81 security: fix build on systems w/out si_syscall
1f7a936 security: whitelist the futex syscall
ee6925b security: whitelist dup syscalls
6fa4f46 security: do not warn when seccomp is disabled in the kernel
c39a557 security: whitelist fakeroot syscalls
bcb6683 security: add a debug handler for seccomp
9d0a60f build: add plumbing for building w/debug code
6e0e840 security: clean up syscall ifdefs
d6fcdb5 security: use seccomp to lock ourselves down
bdf41eb security: lock down privs a bit via prctl
a743806 security: leverage namespaces to restrict the runtime a bit
ef15f60 lddtree.sh: fix interp handling when doing a full listing
5e8a1d4 lddtree.py: fix glob handling w/ld.so.conf
0fccfd9 avoid using \n with warn macros
99f303d build: refresh autotool regen logic for git
ce30b2e build: use pkg-config for libcap settings
0afc2cc scanelf: fix memory leak with the -s option
51d892d debug: improve cleanup logic
cf37405 build: use pkg-config for libcap settings
ca9a45b use __typeof__ instead of typeof to build with stricter standards

--
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada, K2K 2W5
--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------040402000500040503080507--
