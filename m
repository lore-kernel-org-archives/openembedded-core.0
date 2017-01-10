Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA9A76E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 14:45:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n13so8500646qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 06:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v30jarlKpmD4yTIjFJNainghXktbS7TF6JyKItO47NA=;
	b=n+hYGHENOTFnVG2anAcRpkm2jNoiksdsEUiIN57/+YSxRRpVKvf2rQu5fe4dsF9k8B
	4kn2RdIS8XQM9Zi8MYHdTZAQ3eugRdcJaRNo8wE0bS4U8BVZ5HtnfSNW5XIff/BavaRd
	gt7djAyZtn9rEYoB9sWwYh11AVE1zYqrXCJyNVgJJcE/HVfgxXUqgB1TOTPGTrzKSMeE
	GvRR4wtI0tVJC8jAodlVQ7nOw7UwZfk4ZlDqRbMMoxLQhNL/CwU2fHPAGZGH8luU4M1v
	Luf5VI2OQ5898QjQX16LGsbkwzHzUNdXfVpPKiBpSt2fQIjxG2uOjgkEH8idUlH9GObS
	U8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v30jarlKpmD4yTIjFJNainghXktbS7TF6JyKItO47NA=;
	b=AEzLARZeFF8JiCk2hT2Lw7kQpVMJP0Ww0aDgWfoSn8xS3p7XZnQ0G3uQx5TdAvnoRA
	z2Zp9YxJX2liQesNXpqC1YD9MglgmH28+VdRWgDBkt/vthGukoopPwYYByhnxwr8FxnG
	WgCYQUHRhioBhBSl61iFWQEjudtKK2SAumCuEjoCeMaYS8wnzlb/U1G6J3ulR2YaZmcR
	DDdKVi/FOn6IZvsSwiefad8M6sytyfzpAMbSvmz5mztQwl2FSsMmGGTJWGitu+Nb9Ym0
	hzSYcDZbeqHpPO4Pi3MRdszygVr38UHWNTBPxkHAJFbo/5uCS30+oAd6DgqOIilJbYb2
	7cPw==
X-Gm-Message-State: AIkVDXKO/4rBpnZhnxmL1LPaQ+xrBVoGlGTLKjNIBMBR73povzBOzzOIld7XtILEup1/3v08VbunTaic27K4rw==
X-Received: by 10.237.40.39 with SMTP id r36mr3270410qtd.282.1484059559826;
	Tue, 10 Jan 2017 06:45:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Tue, 10 Jan 2017 06:45:59 -0800 (PST)
In-Reply-To: <314ad0bd-0cab-723a-520b-2db8b6e3b9f7@gmail.com>
References: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
	<CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
	<314ad0bd-0cab-723a-520b-2db8b6e3b9f7@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jan 2017 09:45:59 -0500
Message-ID: <CADkTA4NSnLvGX8FrFxcKXhWMDeCpn3ez=x8iraDL+RQqzZTGtw@mail.gmail.com>
To: Ola Redell <ola.redell@gmail.com>, "Hatle, Mark" <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel-module-split: Append KERNEL_VERSION string to kernel module name
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
X-List-Received-Date: Tue, 10 Jan 2017 14:46:01 -0000
Content-Type: multipart/alternative; boundary=001a11487ff4e3a9160545be8a4d

--001a11487ff4e3a9160545be8a4d
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 10, 2017 at 3:44 AM, Ola Redell <ola.redell@gmail.com> wrote:

>
>
> On 01/09/2017 06:20 PM, Bruce Ashfield wrote:
>
>
> The functionality you describe is a good thing, but I have a few questions
> to make
> sure I understand the change, and confirm that existing functionality
> isn't broken ..
> and that the internals of the package management do the right thing (I'm
> not an
> expert on those internals .. so bear with me).
>
> I am not an expert either so I thought I'd suggest this since it works for
> me and see how it is received.
>


A good plan. It is always better to spur discussion with a tangible patch,
which it has done!


>
> With this change, do you know if RDEPENDS="kernel-module-foo" still works
> ? or
> does it now have to be RDEPENDS="kernel-module-foo-<version>" ?
>
> No, the old writing would not work. You would need to add the version as
> in your second example. That will break things, true.
>


ok. That was what I thought as well. As you noted, that is a problem since
it would now
mean that any recipe that wants to rrecommend or rdepend on a package no
longer has
kernel version flexibility (unless wildcards are in play) and not the
virtual/kernel type
binding that it may have had before.


> On a similar thought, "smart install kernel-module-foo" would also work ?
> or does it
> now require a version ?
>
> Also in this example you would need to add the version, even though I have
> only used apt-get and not smart.
>
> The meta package "kernel-modules" will work as before, without a version
> postfix.
>

As it turns out, I normally use the meta package myself, but I do know of
others that
don't use it, but do reference individual module packages.


>
> So basically, as I understand it, this may be a blocker for this change.
> Alternatives I can come up with are:
>
> 1) For all packaged kernel modules, add meta packages that depend on the
> correct version of the kernel module itself. Then "kernel-module-foo" would
> depend on "kernel-module-foo-<version>". The package "kernel-modules" would
> then still be made depending on "kernel-module-foo-<version>" and the likes.
>

Wouldn't this break your primary use case ? i.e. if you had two kernels in
the image or
when you install the 2nd newer kernel, the meta packages would conflict and
hence couldn't
be around at the same time ?

Rather than a meta-package, I think it would be feasible to just have the
generated split
modules RPROVIDE both a PN-<VERSION> and PN. i.e. kernel-module-foo and
kernel-module-foo-<version>
would be RPROVIDED by the packages. I'd still consider this the same
solution as #1, just
with a different implementation, but one that wouldn't generate more
packages and slow
the install/generation phase even more.

I'm not sure what happens if two packages can have a different on-disk name
(i.e. kernel-module-foo-1.2
and kernel-module-foo-1.3) and both RPROVIDE "kernel-module-foo". Only one
would be installed,
but if someone did an apt-get or a smart install of kernel-module-foo ..
chaos may erupt.



>
> 2) Make the version postfix configurable with a
> KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was added
> recently). The default would be an empty postfix, but it could be used to
> achieve this functionality for those who need it.
>
> No. 2 is a very simple change. No. 1 is more uncertain (to me at least).
>

I was discussing this change with a few people in person this morning and
we came up with making this
optional as well (your #2), which would ensure that existing use cases are
not broken, but on the
flip side it makes already complex code more complex and would leave some
paths more tested
than others.

If #1 is feasible, I wonder if a variant of both 1 an 2 are viable ? i.e.
make the generation of the
packages always have a version in the name, but make the generation of a
"versionless" meta
package be optional (or a versionless RPROVIDE). In the default case they'd
be enabled, and no
one would notice that anything had changed but the module-split code would
have a single path.
In a case where multiple kernels are to be installed, you'd have to disable
the versionless package
generation.

I mentioned wildcards above, I'm not sure if anyone else reading this
thread knows if RDEPENDS
can use wildcards ? i.e. if RDEPENDS="kernel-module-foo-4%"  or
"kernel-module-foo-%" worked,
then I could see the version string requirement being less of an issue and
not something that would
require constant bumping as the kernel version changed.

Bruce


>
> /Ola
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11487ff4e3a9160545be8a4d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 10, 2017 at 3:44 AM, Ola Redell <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ola.redell@gmail.com" target=3D"_blank">ola.redell@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D"">
    <br>
    <br>
    <div class=3D"m_1982534508734882033moz-cite-prefix">On 01/09/2017 06:20=
 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>The functionality you describe is a good thing, but I
              have a few questions to make<br>
            </div>
            <div>sure I understand the change, and confirm that existing
              functionality isn&#39;t broken .. <br>
            </div>
            <div>and that the internals of the package management do the
              right thing (I&#39;m not an<br>
            </div>
            <div>expert on those internals .. so bear with me).<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote></span>
    I am not an expert either so I thought I&#39;d suggest this since it
    works for me and see how it is received.<span class=3D""><br></span></d=
iv></blockquote><div><br><br></div><div>A good plan. It is always better to=
 spur discussion with a tangible patch, which it has done!<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D=
"#000000"><span class=3D"">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>With this change, do you know if
              RDEPENDS=3D&quot;kernel-module-foo&quot; still works ? or<br>
            </div>
            <div>does it now have to be
              RDEPENDS=3D&quot;kernel-module-foo-&lt;<wbr>version&gt;&quot;=
 ?<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote></span>
    No, the old writing would not work. You would need to add the
    version as in your second example. That will break things, true.<span c=
lass=3D""><br></span></div></blockquote><div><br><br></div><div>ok. That wa=
s what I thought as well. As you noted, that is a problem since it would no=
w<br></div><div>mean that any recipe that wants to rrecommend or rdepend on=
 a package no longer has<br></div><div>kernel version flexibility (unless w=
ildcards are in play) and not the virtual/kernel type <br></div><div>bindin=
g that it may have had before.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D"">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>On a similar thought, &quot;smart install kernel-module-fo=
o&quot;
              would also work ? or does it<br>
            </div>
            <div>now require a version ?<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote></span>
    Also in this example you would need to add the version, even though
    I have only used apt-get and not smart.<br>
    <br>
    The meta package &quot;kernel-modules&quot; will work as before, withou=
t a
    version postfix.<br></div></blockquote><div><br></div><div>As it turns =
out, I normally use the meta package myself, but I do know of others that <=
br></div><div>don&#39;t use it, but do reference individual module packages=
. <br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D=
"#FFFFFF" text=3D"#000000">
    <br>
    So basically, as I understand it, this may be a blocker for this
    change. Alternatives I can come up with are:<br>
    <br>
    1) For all packaged kernel modules, add meta packages that depend on
    the correct version of the kernel module itself. Then
    &quot;kernel-module-foo&quot; would depend on
    &quot;kernel-module-foo-&lt;version&gt;&quot;. The package &quot;kernel=
-modules&quot;
    would then still be made depending on
    &quot;kernel-module-foo-&lt;version&gt;&quot; and the likes.<br></div><=
/blockquote><br></div><div class=3D"gmail_quote">Wouldn&#39;t this break yo=
ur primary use case ? i.e. if you had two kernels in the image or<br>when y=
ou install the 2nd newer kernel, the meta packages would conflict and hence=
 couldn&#39;t<br>be around at the same time ?<br><br></div><div class=3D"gm=
ail_quote">Rather than a meta-package, I think it would be feasible to just=
 have the generated split<br></div><div class=3D"gmail_quote">modules RPROV=
IDE both a PN-&lt;VERSION&gt; and PN. i.e. kernel-module-foo and kernel-mod=
ule-foo-&lt;version&gt;<br></div><div class=3D"gmail_quote">would be RPROVI=
DED by the packages. I&#39;d still consider this the same solution as #1, j=
ust<br></div><div class=3D"gmail_quote">with a different implementation, bu=
t one that wouldn&#39;t generate more packages and slow <br></div><div clas=
s=3D"gmail_quote">the install/generation phase even more.<br><br></div><div=
 class=3D"gmail_quote">I&#39;m not sure what happens if two packages can ha=
ve a different on-disk name (i.e. kernel-module-foo-1.2<br>and kernel-modul=
e-foo-1.3) and both RPROVIDE &quot;kernel-module-foo&quot;. Only one would =
be installed,<br></div><div class=3D"gmail_quote">but if someone did an apt=
-get or a smart install of kernel-module-foo .. chaos may erupt.<br></div><=
div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><br></div><div c=
lass=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div b=
gcolor=3D"#FFFFFF" text=3D"#000000">
    <br>
    2) Make the version postfix configurable with a
    KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was
    added recently). The default would be an empty postfix, but it could
    be used to achieve this functionality for those who need it.<br>
    <br>
    No. 2 is a very simple change. No. 1 is more uncertain (to me at
    least).<br></div></blockquote><div><br></div><div>I was discussing this=
 change with a few people in person this morning and we came up with making=
 this<br></div><div>optional as well (your #2), which would ensure that exi=
sting use cases are not broken, but on the<br></div><div>flip side it makes=
 already complex code more complex and would leave some paths more tested<b=
r></div><div>than others.<br><br></div><div>If #1 is feasible, I wonder if =
a variant of both 1 an 2 are viable ? i.e. make the generation of the <br><=
/div><div>packages always have a version in the name, but make the generati=
on of a &quot;versionless&quot; meta<br></div><div>package be optional (or =
a versionless RPROVIDE). In the default case they&#39;d be enabled, and no<=
br>one would notice that anything had changed but the module-split code wou=
ld have a single path. <br>In a case where multiple kernels are to be insta=
lled, you&#39;d have to disable the versionless package<br>generation.<br><=
/div><div><br></div><div>I mentioned wildcards above, I&#39;m not sure if a=
nyone else reading this thread knows if RDEPENDS<br></div><div>can use wild=
cards ? i.e. if RDEPENDS=3D&quot;kernel-module-foo-4%&quot;=C2=A0 or &quot;=
kernel-module-foo-%&quot; worked,<br></div><div>then I could see the versio=
n string requirement being less of an issue and not something that would<br=
></div><div>require constant bumping as the kernel version changed.<br><br>=
</div><div>Bruce<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgc=
olor=3D"#FFFFFF" text=3D"#000000">
    <br>
    /Ola<br>
    <br>
  </div>

</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11487ff4e3a9160545be8a4d--
