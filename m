Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RXHv7-0003ET-2L
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 20:40:18 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2011 11:32:25 -0800
Received: by iaqq3 with SMTP id q3so3197665iaq.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Dec 2011 11:32:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.231.4.42 with SMTP id 42mr1627149ibp.67.1323027141327; Sun, 04
	Dec 2011 11:32:21 -0800 (PST)
Received: by 10.50.184.166 with HTTP; Sun, 4 Dec 2011 11:32:21 -0800 (PST)
In-Reply-To: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
References: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
Date: Sun, 4 Dec 2011 11:32:21 -0800
Message-ID: <CAPhnLPBwuKWbVXrk9feYzcxQOogtif7As+BgFqT-s1njDtJSKA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_populate_lic_setscene when building LSB on edison
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
X-List-Received-Date: Sun, 04 Dec 2011 19:40:18 -0000
Content-Type: multipart/alternative; boundary=0015176f08a6c97d0a04b3494227

--0015176f08a6c97d0a04b3494227
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 4, 2011 at 10:44 AM, McClintock Matthew-B29882 <
B29882@freescale.com> wrote:

> Can anyone comment if this issue has been resolved on master? It's
> very random which package it occurs on, it only seems to happen when
> building the LSB target, and it also appears to happen on my CentOS 5
> box and not my Ubuntu box (at least less often)... sometimes it
> happens only on one package in a build, sometimes it's 5-10
> packages...
>
>
I haven't run across this. Is this from a clean sstate-cache? I'm assuming
this is from an older release (as bind is now at 9.8.1).

-b



> ERROR: Task 3209
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-graphics/freetype/
> freetype_2.4.6.bb,
> do_populate_lic_setscene) failed with exit code '1'
> ERROR: Task 3125
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/augeas/
> augeas_0.8.1.bb,
> do_populate_sysroot_setscene) failed with exit code '1'
> ERROR: Task 3106
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-support/icu/icu_3.6.bb,
> do_package_setscene) failed with exit code '1'
> ERROR: Task 3147
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/newt/
> libnewt_0.52.13.bb,
> do_populate_sysroot_setscene) failed with exit code '1'
> ERROR: Task 3120
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/libzypp/
> libzypp_git.bb,
> do_populate_lic_setscene) failed with exit code '1'
> ERROR: Task 3164
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-connectivity/bind/
> bind_9.7.2-P3.bb,
> do_populate_lic_setscene) failed with exit code '1'
>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

--0015176f08a6c97d0a04b3494227
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sun, Dec 4, 2011 at 10:44 AM, McClintock Matt=
hew-B29882 <span dir=3D"ltr">&lt;<a href=3D"mailto:B29882@freescale.com">B2=
9882@freescale.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;">
Can anyone comment if this issue has been resolved on master? It&#39;s<br>
very random which package it occurs on, it only seems to happen when<br>
building the LSB target, and it also appears to happen on my CentOS 5<br>
box and not my Ubuntu box (at least less often)... sometimes it<br>
happens only on one package in a build, sometimes it&#39;s 5-10<br>
packages...<br>
<br></blockquote><div><br>I haven&#39;t run across this. Is this from a cle=
an sstate-cache? I&#39;m assuming this is from an older release (as bind is=
 now at 9.8.1).<br><br>-b<br><br>=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">

ERROR: Task 3209<br>
(/opt/yocto/cache-test/p2041rdb/meta/recipes-graphics/freetype/<a href=3D"h=
ttp://freetype_2.4.6.bb" target=3D"_blank">freetype_2.4.6.bb</a>,<br>
do_populate_lic_setscene) failed with exit code &#39;1&#39;<br>
ERROR: Task 3125<br>
(/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/augeas/<a href=3D"htt=
p://augeas_0.8.1.bb" target=3D"_blank">augeas_0.8.1.bb</a>,<br>
do_populate_sysroot_setscene) failed with exit code &#39;1&#39;<br>
ERROR: Task 3106<br>
(/opt/yocto/cache-test/p2041rdb/meta/recipes-support/icu/<a href=3D"http://=
icu_3.6.bb" target=3D"_blank">icu_3.6.bb</a>,<br>
do_package_setscene) failed with exit code &#39;1&#39;<br>
ERROR: Task 3147<br>
(/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/newt/<a href=3D"http:=
//libnewt_0.52.13.bb" target=3D"_blank">libnewt_0.52.13.bb</a>,<br>
do_populate_sysroot_setscene) failed with exit code &#39;1&#39;<br>
ERROR: Task 3120<br>
(/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/libzypp/<a href=3D"ht=
tp://libzypp_git.bb" target=3D"_blank">libzypp_git.bb</a>,<br>
do_populate_lic_setscene) failed with exit code &#39;1&#39;<br>
ERROR: Task 3164<br>
(/opt/yocto/cache-test/p2041rdb/meta/recipes-connectivity/bind/<a href=3D"h=
ttp://bind_9.7.2-P3.bb" target=3D"_blank">bind_9.7.2-P3.bb</a>,<br>
do_populate_lic_setscene) failed with exit code &#39;1&#39;<br>
<br>
-M<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Elizabeth Flanagan<br>Y=
octo Project<br>Build and Release<br>

--0015176f08a6c97d0a04b3494227--
