Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfXTB-0006em-Io
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:25:49 +0200
Received: by eekd49 with SMTP id d49so951585eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=eRlx9MYjgEriB5yNGxk9/REh2Rq07ok1y1UDkMSzLIk=;
	b=a6imRTy1g/4CsDOysrYH8L7C+pd+MYjn2PyXWK+Ngkp1WoG3rccqOAjbZ9zQlJV9+D
	MbRgrohgYJSFddVhgLLGOg8IPvmaJNEvoFavqnOlIa6DHvkhrDtawkrR98QICFrXVED4
	I4jkMt1tlMqJUqane9cBBXZ8dEFZfnimNNFn1JmB9wakrGhtQ8Tn1agVlzuhn9n4nblT
	rl5ZIA25BMDrDvX9WNeqRIY71tE/67m+uXsBOFkvH4hMFsiBslOjunJK9zVVp7VYTNQj
	SIYAisve9qNKYlgzV+QZrOXrs5wkk3eSIw65Zj/uZmMJWA8sf7bc1cF46rFUvfZkeyqj
	7uIA==
MIME-Version: 1.0
Received: by 10.14.100.194 with SMTP id z42mr1488807eef.146.1339769710962;
	Fri, 15 Jun 2012 07:15:10 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Fri, 15 Jun 2012 07:15:10 -0700 (PDT)
In-Reply-To: <20120615063647.GU3140@jama.jama.net>
References: <20120615063647.GU3140@jama.jama.net>
Date: Fri, 15 Jun 2012 07:15:10 -0700
Message-ID: <CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl does not build on recent distributions with perl-5.16.0
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
X-List-Received-Date: Fri, 15 Jun 2012 14:25:49 -0000
Content-Type: multipart/alternative; boundary=bcaec521556bb3e7d704c28371c3

--bcaec521556bb3e7d704c28371c3
Content-Type: text/plain; charset=UTF-8

On Thursday, June 14, 2012, Martin Jansa wrote:

> Hi,
>
> openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
>
> is using perlpath.pl:
>
>  do_configure () {
>          cd util
>          perl perlpath.pl ${STAGING_BINDIR_NATIVE}


I wonder why it's using host perl and not staged perl-native
May be missing inherit perlnative

>  ...
>
> and perlpath.pl is using find.pl:
> openssl-1.0.0i/util/perlpath.pl:
>  #!/usr/local/bin/perl
>  #
>  # modify the '#!/usr/local/bin/perl'
>  # line in all scripts that rely on perl.
>  #
>
>  require "find.pl";
>  ...
>
> which was removed in perl-5.16.0 and marked as deprecated and
> unmaintained in 5.14 and older:
> /tmp/usr/lib/perl5/5.14.2/find.pl:
>  warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl
>  core distribution in the next major release. Please install it from the
>  CPAN distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]},
>  line @{[(caller)[2]]}.\n";
>
>  # This library is deprecated and unmaintained. It is included for
>  # compatibility with Perl 4 scripts which may use it, but it will be
>  # removed in a future version of Perl. Please use the File::Find module
>  # instead.
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com <javascript:;>
>

--bcaec521556bb3e7d704c28371c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, June 14, 2012, Martin Jansa  wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hi,<br>
<br>
openembedded-core/meta/recipes-connectivity/openssl/openssl.inc<br>
<br>
is using <a href=3D"http://perlpath.pl" target=3D"_blank">perlpath.pl</a>:<=
br>
<br>
 =C2=A0do_configure () {<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd util<br>
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perl <a href=3D"http://perlpath.pl" targ=
et=3D"_blank">perlpath.pl</a> ${STAGING_BINDIR_NATIVE}</blockquote><div><br=
></div><div>I wonder why it&#39;s using host perl and not staged perl-nativ=
e</div><div>May be missing inherit perlnative=C2=A0<span></span></div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =C2=A0...<br>
<br>
and <a href=3D"http://perlpath.pl" target=3D"_blank">perlpath.pl</a> is usi=
ng <a href=3D"http://find.pl" target=3D"_blank">find.pl</a>:<br>
openssl-1.0.0i/util/<a href=3D"http://perlpath.pl" target=3D"_blank">perlpa=
th.pl</a>:<br>
 =C2=A0#!/usr/local/bin/perl<br>
 =C2=A0#<br>
 =C2=A0# modify the &#39;#!/usr/local/bin/perl&#39;<br>
 =C2=A0# line in all scripts that rely on perl.<br>
 =C2=A0#<br>
<br>
 =C2=A0require &quot;<a href=3D"http://find.pl" target=3D"_blank">find.pl</=
a>&quot;;<br>
 =C2=A0...<br>
<br>
which was removed in perl-5.16.0 and marked as deprecated and<br>
unmaintained in 5.14 and older:<br>
/tmp/usr/lib/perl5/5.14.2/<a href=3D"http://find.pl" target=3D"_blank">find=
.pl</a>:<br>
 =C2=A0warn &quot;Legacy library @{[(caller(0))[6]]} will be removed from t=
he Perl<br>
 =C2=A0core distribution in the next major release. Please install it from =
the<br>
 =C2=A0CPAN distribution Perl4::CoreLibs. It is being used at @{[(caller)[1=
]]},<br>
 =C2=A0line @{[(caller)[2]]}.\n&quot;;<br>
<br>
 =C2=A0# This library is deprecated and unmaintained. It is included for<br=
>
 =C2=A0# compatibility with Perl 4 scripts which may use it, but it will be=
<br>
 =C2=A0# removed in a future version of Perl. Please use the File::Find mod=
ule<br>
 =C2=A0# instead.<br>
<br>
Cheers,<br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"javascript:;" =
onclick=3D"_e(event, &#39;cvml&#39;, &#39;Martin.Jansa@gmail.com&#39;)">Mar=
tin.Jansa@gmail.com</a><br>
</blockquote>

--bcaec521556bb3e7d704c28371c3--
