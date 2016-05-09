Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA68B60721
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 19:35:24 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id x201so222832912oif.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 12:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=/CfWXlUc5q5WCu2z1Ro7QGqy8LEG2Da9GlJemRWA/Ng=;
	b=CTzrxDgycmgoY3RdCggcfx5v6HMwyNaTiVK2vNFrUg/S00rUerZ+o5CaK1ittfR/hN
	Id+dWFvgfnNHIRKJw3QDu5/8h7lrp7LvAWb1pkpHd6Q4c+xK8mUl+0MTe3T64BMaOOIw
	Qin8jtg1YsCekfa7ds/AhZh6AkbOxd07/SiJQDutYVGXL4rAeOO3fAVl/+9CvTGPAmsi
	S/APxVrKEoD539AjJUdCLZ4HIl9E630pRHqyNlBgLWXpOu7K8/jHBqdP4+k3pdKXefem
	kioArSer49+dDOf+tmE4BnM2P/fFuJwpK7L+MxC+kTbP8iV8p8ddmC1bXuK7cS5QtjIg
	Wgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=/CfWXlUc5q5WCu2z1Ro7QGqy8LEG2Da9GlJemRWA/Ng=;
	b=E/g0xqSsART0m1pWTregDQXIhC59VPtUzzLcn2Q5k737VVdBoph25kk4sEX3MnTWLg
	iMdMykmM3I1Ed8WvuJkEJMywJrjDGewuCEMfWT1jdzDJSdmpFI1S6x1wMKhZhYc1qj40
	YNM+wFIO2eo65BbZq3ZPxSHz7kmhnN+pyfrkjz2cG/He0HfBKkqSD3U8exA+oXHmOh9n
	pL7LQBuybuCo6Kj43iUW1/q+TnVT3X2AmdIHm4VYX5L8b2ycDUQvgX+4ETNWBtrAeawe
	2cqu7/ikQ7plO4gGoiBaVP+3hzo9axRc5qns0XGO+mw0/MAaxrXsy22mdma0ALeGNS2B
	jUHQ==
X-Gm-Message-State: AOPr4FUPHYPzXktM28XehWY8yVrR/0LqzUA+w5EFRCjFuXVtGKj93c+slek2mvLxn5MwYpF4EgaJSECp122llQ==
MIME-Version: 1.0
X-Received: by 10.202.46.139 with SMTP id u133mr15933045oiu.16.1462822525443; 
	Mon, 09 May 2016 12:35:25 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 12:35:25 -0700 (PDT)
In-Reply-To: <CABcZANmxKXC9waAVi2i8hs3DGbiNddOvW54t0hLwaEpUt8pWQg@mail.gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
	<CABcZANmxKXC9waAVi2i8hs3DGbiNddOvW54t0hLwaEpUt8pWQg@mail.gmail.com>
Date: Mon, 9 May 2016 15:35:25 -0400
Message-ID: <CADkTA4MbKiKahDZTmRjC1fkDq3cKmf7ZbHn0vy3ZPUOk6Ld21A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Tom Zanussi <tom.zanussi@intel.com>
Subject: Re: [RFC PATCH 6/6] classes/image: check kernel config supports IMAGE_FSTYPES items
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
X-List-Received-Date: Mon, 09 May 2016 19:35:25 -0000
Content-Type: multipart/alternative; boundary=001a1137c99cffa67c05326de8fa

--001a1137c99cffa67c05326de8fa
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 12:57 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Mon, May 9, 2016 at 5:05 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
>> paul.eggleton@linux.intel.com> wrote:
>>
>>> A lot of the IMAGE_FSTYPES items require the appropriate filesystem
>>> driver to be enabled in the kernel configuration; e.g. in order to read
>>> a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check
>>> to ensure that is the case.
>>>
>>
>>
>> So what's the overall design for this ? Is it documented anywhere ? This
>> is something
>> that we talked about a couple of years and I have reservations and
>> objections to
>> the current implementation.
>>
>> .. but since I can only see bits and chunks of patches, I'd rather read
>> something
>> complete and offer some more detailed feedback.
>>
>> Bottom line: I see a slippery slope to tightly specified option that
>> depend on kernel
>> versions, I see kernel options sprayed all over layers, etc, etc. Which
>> is exactly
>> what we've been trying to avoid with the centralized kernel meta-data,
>> and again,
>> there's a mechanism that I finished early this year to extend those
>> options to any
>> kernel, enforce, warn, error, etc .. but now, I'll just toss it into the
>> bin.
>>
>
> Perhaps this functionality should be by feature or capability rather than
> individual options, and let the kernel build determine what features it
> provides based on its configuration.
>

You hit the nail on the head with that comment. There are some old bugzilla
lurking around
about distro -> kernel options (aka kernel features) that I've suggested a
similar concept
(or even machine features -> kernel).

IMHO some level of abstraction is needed for both, since otherwise we end
up tightly
coupling recipes to a machine and kernel combination.

Someone can ask for a specific option all they like, but unless they know
the details
of the kernel provider .. they are basically making a guess, and someone
working with
many different types of recipes shouldn't have to know the details of every
kernel tree
they are building. Sure it isn't widespread, or a lot of recipes, but again
.. I see a slippery
slope.

In the case kernel doesn't have it they fail (or if they've specified
something wrong), but
there are often substitutions that can be performed .. or optional
features, etc.  If there's some
level of abstraction, the kernel provider itself can turn on the right
options, avoid common / minor
errors, make suggestions and ensure that the h/w (and kernel) actually has
the capability.

The h/w actually having the capability is a significant issue for me as
well, since asking for
something .. but not actually having the required h/w (or arch) support,
and having no way
to abstractly figure out if something is supported .. means that even more
knowledge of
the kernel and the machine starts slipping into recipes and ends up being
spread all around
the layer stack.

Cheers,

Bruce




>
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137c99cffa67c05326de8fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 12:57 PM, Christopher Larson <span dir=3D"ltr">&=
lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quot=
e">On Mon, May 9, 2016 at 5:05 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On=
 Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">A lo=
t of the IMAGE_FSTYPES items require the appropriate filesystem<br>
driver to be enabled in the kernel configuration; e.g. in order to read<br>
a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check<br>
to ensure that is the case.<br></blockquote><div><br></div><div><br></div><=
/span><div>So what&#39;s the overall design for this ? Is it documented any=
where ? This is something</div><div>that we talked about a couple of years =
and I have reservations and objections to=C2=A0</div><div>the current imple=
mentation.</div><div><br></div><div>.. but since I can only see bits and ch=
unks of patches, I&#39;d rather read something</div><div>complete and offer=
 some more detailed feedback.</div><div><br></div><div>Bottom line: I see a=
 slippery slope to tightly specified option that depend on kernel</div><div=
>versions, I see kernel options sprayed all over layers, etc, etc. Which is=
 exactly</div><div>what we&#39;ve been trying to avoid with the centralized=
 kernel meta-data, and again,</div><div>there&#39;s a mechanism that I fini=
shed early this year to extend those options to any</div><div>kernel, enfor=
ce, warn, error, etc .. but now, I&#39;ll just toss it into the bin.</div><=
/blockquote></div><br></span>Perhaps this functionality should be by featur=
e or capability rather than individual options, and let the kernel build de=
termine what features it provides based on its configuration.</div></div></=
blockquote><div><br></div><div>You hit the nail on the head with that comme=
nt. There are some old bugzilla lurking around</div><div>about distro -&gt;=
 kernel options (aka kernel features) that I&#39;ve suggested a similar con=
cept</div><div>(or even machine features -&gt; kernel).</div><div><br></div=
><div>IMHO some level of abstraction is needed for both, since otherwise we=
 end up tightly</div><div>coupling recipes to a machine and kernel combinat=
ion.=C2=A0</div><div><br></div><div>Someone can ask for a specific option a=
ll they like, but unless they know the details</div><div>of the kernel prov=
ider .. they are basically making a guess, and someone working with</div><d=
iv>many different types of recipes shouldn&#39;t have to know the details o=
f every kernel tree</div><div>they are building. Sure it isn&#39;t widespre=
ad, or a lot of recipes, but again .. I see a slippery</div><div>slope.</di=
v><div><br></div><div>In the case kernel doesn&#39;t have it they fail (or =
if they&#39;ve specified something wrong), but</div><div>there are often su=
bstitutions that can be performed .. or optional features, etc.=C2=A0 If th=
ere&#39;s some</div><div>level of abstraction, the kernel provider itself c=
an turn on the right options, avoid common / minor</div><div>errors, make s=
uggestions and ensure that the h/w (and kernel) actually has the capability=
.</div><div><br></div><div>The h/w actually having the capability is a sign=
ificant issue for me as well, since asking for</div><div>something .. but n=
ot actually having the required h/w (or arch) support, and having no way</d=
iv><div>to abstractly figure out if something is supported .. means that ev=
en more knowledge of</div><div>the kernel and the machine starts slipping i=
nto recipes and ends up being spread all around</div><div>the layer stack.<=
/div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div><=
br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D"HOEnZb"><font color=
=3D"#888888"><br>-- <br><div>Christopher Larson<br>clarson at kergoth dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>=
Senior Software Engineer, Mentor Graphics</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a1137c99cffa67c05326de8fa--
