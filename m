Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6BE6612C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 18:06:23 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id rc4so146727igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ngEZJjAeIGQY8CWebAyJ2+R6cY4Wy2mePGJChM80uHM=;
	b=sUin3hYMAEC4Y74LM+uh8o8+ENdvet2dGrC1li7feM+3qiCKaDp9Y26HATqWd9QSyx
	p0+trfgFdLgLBwNVrF7Xq07Mm+Tn+JIPJZk8q6imj90W8ADVDa8X5+8NtvmWPS5XiXj2
	ALng2EtPFdwXAyWB6ycm0lJ+gRlXNq8msw35poc1WNBKwIdlL2ylDl5BRvT3lTcg5fJs
	dDUrX23LJTosVy1BOBlN6eT9UlrRq32gGKkwFHC/Kzvu39Byk3+bH4SMt/kZE7wh458s
	V/UVqCaDnwXPtXz0i7ks/qNNo/GMrsIEJsRgz/bw++7YNx8GO0n5u8TNXWM7UbtJuOHc
	oDDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ngEZJjAeIGQY8CWebAyJ2+R6cY4Wy2mePGJChM80uHM=;
	b=MT6cz5EQqzysljTk0v12s1Q2hIpebeQBG89ljBLaWQX0rI1RwW3A23jTCBg0UBw1vM
	+DyDD/Z5pKdDxMZB6MEqT9V8dh7G88kNB3Zy92XYfD3Oz2W4/StwjUFtVZxmXEYI4WRL
	h6YpsTRkjz06Jhgts46cAdhrPveejzWSmoBccSnb6FXWa2nvNoffygRjJQKQJdVb6UvA
	kxVrHQKj5K51uiUVEKg9/E/NWl0PQARFeJl9+pdTS5QnMTQSDs7mcGfZ111L4YLkuyfJ
	NChUWF5gRW9SD5HNwhYJ/N/5JRfoHNrb6hyOjTRJ5jE0TbJSym3U4jwJ+giVFo/08uX5
	PK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ngEZJjAeIGQY8CWebAyJ2+R6cY4Wy2mePGJChM80uHM=;
	b=g3WMRRbDe++N2GtdsgX4SNESjTNX6NTiLDX7/eSoPs5rU1dZo2jdCPbdhl61Tn36Zi
	AonQJQV0KUMtibkfUaGESGxZ5kAsIltGXHGPy0MX2mLIGrq0M3/wgttnGderkG/oEHB1
	IQwwmvd6nO1/YA6tslWQDsv+2aJ7UjiyT2FkwShlRa8P3dJr+VqSzw3lTLVwP0EgA3wr
	xSVcbbjp01G0XS4Qb+hTvIItg+8Pu8WKGxTeyfZGh30BWk2MnzvPdzJ98SxFS7NTqmIJ
	U+IN39UTicjFRdYsuLnmGnONpZ1YplkCon8Xc46wub3Dw132lEFPEjyE0I69+SmkfTng
	E+Qg==
X-Gm-Message-State: AOPr4FX0CY2anAXdazEuZMXNWcj6JCithiYcVkSoq2A8QNJGUFi7qlqaDM2U8MG+yXziQUkh5Sn/tjBkRsBXxQ==
X-Received: by 10.107.147.7 with SMTP id v7mr8771779iod.3.1463076384539; Thu,
	12 May 2016 11:06:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Thu, 12 May 2016 11:06:05 -0700 (PDT)
In-Reply-To: <e9b4b7a9c7391a30eb2c08ef245e70d8@smile.fr>
References: <cover.1462216694.git.chris_larson@mentor.com>
	<e9b4b7a9c7391a30eb2c08ef245e70d8@smile.fr>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 12 May 2016 11:06:05 -0700
X-Google-Sender-Auth: hZ6tsL1QpuW59VztHMX6VIqVP0M
Message-ID: <CABcZAN=ZXjXSSeQsVb9etn5X-jsL+W7Ft82r7Z+eKgRcLe1OYA@mail.gmail.com>
To: Jeremy ROSEN <jeremy.rosen@smile.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-master][RFC PATCH 0/3] Support template files for wic wks
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
X-List-Received-Date: Thu, 12 May 2016 18:06:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c055f682e08370532a90496

--94eb2c055f682e08370532a90496
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2016 at 9:05 AM, Jeremy ROSEN <jeremy.rosen@smile.fr> wrote:

> Le 02/05/2016 21:23, Christopher Larson a =C3=A9crit :
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> This adds support for .wks.in files as WKS_FILE.
>>
>> These files are treated as the contents of a bitbake variable, so usual
>> bitbake variable references are supported. I considered using another
>> templating mechanism, for example the one used by yocto-layer, but then
>> we'd
>> end up largely mapping metadata variables to template fields anyway,
>> which is
>> a pointless indirection. Let bitbake expand the variables directly
>> instead.
>>
>> This feature lets us, for example, reference ${APPEND} in --append, and
>> avoid
>> hardcoding the serial console tty in the wks file, and let the user's
>> changes
>> to APPEND affect wic the way they do the other image construction
>> mechanisms.
>>
>> The template is read in and set in a variable at parse time, so changes
>> to the
>> variables referenced by the template will result in rebuilding the image=
.
>>
>> It's been suggested that the name should better reflect how its contents
>> are
>> used, i.e. .bbin or so. I've also considered including something like
>> 'bbv' or
>> similar, to indicate its contents are that of a bitbake value. I think
>> this
>> should be discussed.
>>
>> I'd love to hear questions or comments on this. I think the value is
>> clear,
>> and it's something we need to solve, but I'd like to hear if others agre=
e
>> or
>> disagree on that, and whether this implementation is appropriate.
>>
>>
>>
>
> We have been discussing this a bit with Chris on IRC and i'll add a coupl=
e
> of thoughts we had so that discussion isn't completely lost.
>
> As a final user of yocto, I find the need for templating in wic very
> usefull, it would allow me to specify disk size in the machine
> specification and adapt the wic image accordingly, or use different disk
> names ( mmcblk vs sda)
>
> however my need is more generic and I think it would be interesting to
> consider a bigger problem : using yocto variables in configuration files.
> (I mean files in /etc/ here, not yocto configuration)
>
> It is a pretty common problem to have to tailor configuration files for
> particular machines, distro features, optional dependencies etc... this i=
s
> possible to do using OVERRIDES but it can only be done at the whole-file
> level, not within a configuration file. Moreover it makes some complex
> cases very tricky. let's present an example
>
> It is pretty common to need to include the build-machine's ip address in =
a
> configuration file. This can be usefull to send logs if the build machine
> is also the developer's machine. The ip address of the build machine can =
be
> easily obtained via python and put into the bitbake environement, but usi=
ng
> that variable to set a value in a random file in /etc is pretty tricky.
>
> similarly, I like to include my public ssh key as an authorized key for
> root on my builds, il makes testing way easier
>
> I think having a generic templating mechanism that would recognise some
> source files as needing template extension would be awesome. I don't
> understand fully how bitbake/yocto works, so I can't design a complete
> archtecture, but here are a couple of thought we had with Chris on IRC
>
> * recognise *.in in the same way *.patch are recognized. Is there a risk
> of improper expansion ? maybe specify that templating is needed as a
> parameter in SRC_URI
> * should expansion be in do_fetch or do_patch or somewhere else... images
> tend to skip do_patch, but do_fetch is on the bitbake side IIUC. would th=
at
> be a problem ?
> * interaction with sstate and rebuilding needs to be considered... change=
s
> need to be detected post-templating obviously
>
> Overall, I really like the idea of this patch, there are lot of things in
> a .wks that need expansion, but I think there is even more in every other
> configuration file of the system.
>
> Hope my random thoughts helped



This is an interesting concept, certainly a generic templating mechanism
for source files may be of use. I expect we could get this merged, and open
a new yocto feature request in bugzilla to add a more generic mechanism,
possibly based on this sort of thing.

The main concern I'd have is making sure changes to the referenced
variables, or changes to the list of referenced variables, changes
appropriate checksums, so as was the case in this patch series, they'd have
to be read in at parse time to gather that info. As long as the files are
relatively small, it should be reasonable to do so, and I expect the common
case will be small config files, so I doubt it'd be a blocking issue.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c055f682e08370532a90496
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, May 8, 2016 at 9:05 AM, Jeremy ROSEN <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile.fr</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Le =
02/05/2016 21:23, Christopher Larson a =C3=A9crit=C2=A0:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" tar=
get=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
This adds support for .<a href=3D"http://wks.in" rel=3D"noreferrer" target=
=3D"_blank">wks.in</a> files as WKS_FILE.<br>
<br>
These files are treated as the contents of a bitbake variable, so usual<br>
bitbake variable references are supported. I considered using another<br>
templating mechanism, for example the one used by yocto-layer, but then we&=
#39;d<br>
end up largely mapping metadata variables to template fields anyway, which =
is<br>
a pointless indirection. Let bitbake expand the variables directly instead.=
<br>
<br>
This feature lets us, for example, reference ${APPEND} in --append, and avo=
id<br>
hardcoding the serial console tty in the wks file, and let the user&#39;s c=
hanges<br>
to APPEND affect wic the way they do the other image construction mechanism=
s.<br>
<br>
The template is read in and set in a variable at parse time, so changes to =
the<br>
variables referenced by the template will result in rebuilding the image.<b=
r>
<br>
It&#39;s been suggested that the name should better reflect how its content=
s are<br>
used, i.e. .bbin or so. I&#39;ve also considered including something like &=
#39;bbv&#39; or<br>
similar, to indicate its contents are that of a bitbake value. I think this=
<br>
should be discussed.<br>
<br>
I&#39;d love to hear questions or comments on this. I think the value is cl=
ear,<br>
and it&#39;s something we need to solve, but I&#39;d like to hear if others=
 agree or<br>
disagree on that, and whether this implementation is appropriate.<br>
<br>
<br>
</blockquote>
<br>
<br></span>
We have been discussing this a bit with Chris on IRC and i&#39;ll add a cou=
ple of thoughts we had so that discussion isn&#39;t completely lost.<br>
<br>
As a final user of yocto, I find the need for templating in wic very useful=
l, it would allow me to specify disk size in the machine specification and =
adapt the wic image accordingly, or use different disk names ( mmcblk vs sd=
a)<br>
<br>
however my need is more generic and I think it would be interesting to cons=
ider a bigger problem : using yocto variables in configuration files. (I me=
an files in /etc/ here, not yocto configuration)<br>
<br>
It is a pretty common problem to have to tailor configuration files for par=
ticular machines, distro features, optional dependencies etc... this is pos=
sible to do using OVERRIDES but it can only be done at the whole-file level=
, not within a configuration file. Moreover it makes some complex cases ver=
y tricky. let&#39;s present an example<br>
<br>
It is pretty common to need to include the build-machine&#39;s ip address i=
n a configuration file. This can be usefull to send logs if the build machi=
ne is also the developer&#39;s machine. The ip address of the build machine=
 can be easily obtained via python and put into the bitbake environement, b=
ut using that variable to set a value in a random file in /etc is pretty tr=
icky.<br>
<br>
similarly, I like to include my public ssh key as an authorized key for roo=
t on my builds, il makes testing way easier<br>
<br>
I think having a generic templating mechanism that would recognise some sou=
rce files as needing template extension would be awesome. I don&#39;t under=
stand fully how bitbake/yocto works, so I can&#39;t design a complete archt=
ecture, but here are a couple of thought we had with Chris on IRC<br>
<br>
* recognise *.in in the same way *.patch are recognized. Is there a risk of=
 improper expansion ? maybe specify that templating is needed as a paramete=
r in SRC_URI<br>
* should expansion be in do_fetch or do_patch or somewhere else... images t=
end to skip do_patch, but do_fetch is on the bitbake side IIUC. would that =
be a problem ?<br>
* interaction with sstate and rebuilding needs to be considered... changes =
need to be detected post-templating obviously<br>
<br>
Overall, I really like the idea of this patch, there are lot of things in a=
 .wks that need expansion, but I think there is even more in every other co=
nfiguration file of the system.<br>
<br>
Hope my random thoughts helped</blockquote></div><br><br><div>This is an in=
teresting concept, certainly a generic templating mechanism for source file=
s may be of use. I expect we could get this merged, and open a new yocto fe=
ature request in bugzilla to add a more generic mechanism, possibly based o=
n this sort of thing.</div><div><br></div><div>The main concern I&#39;d hav=
e is making sure changes to the referenced variables, or changes to the lis=
t of referenced variables, changes appropriate checksums, so as was the cas=
e in this patch series, they&#39;d have to be read in at parse time to gath=
er that info. As long as the files are relatively small, it should be reaso=
nable to do so, and I expect the common case will be small config files, so=
 I doubt it&#39;d be a blocking issue.</div>-- <br><div class=3D"gmail_sign=
ature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics</div>
</div></div>

--94eb2c055f682e08370532a90496--
