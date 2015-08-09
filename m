Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2B1766F5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 17:03:25 +0000 (UTC)
Received: by iodd187 with SMTP id d187so150575600iod.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Aug 2015 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1B+aSpLoJgZYA5YKlJ1kkq5/I/ssd70HIUTWA4dvnsc=;
	b=bjSNanOFhlT/MLBKeO0vIQCZSQUtBG1TJduMR88YWKW168Vizm8voH+IoNXOm1m9/P
	FkVVYYmVG6wnHNQZX9x9XGMEfn+gD8D6GQ1J4zdu0/tHrDyzvuBh5C0qS+oq9jS3fMSI
	ImYIy+PEv/gpS2ccI+5pfxA4mQ62ol7JX71q1MWXO08D2ydVOfyr40DfX//e23S/6VCT
	R6E8c3YxbkAQ5f/kgNj9vXq2XWwViKhFRpkHfGWsirwIG1/GbEHXn/fEMrxTaty50jmt
	Mo1Xm+0LygoknXLdwjDNICffLB6j814tNt/7EPu5DU/REB+CjV9QSAgkv5FAsWOUB5Tp
	0HqA==
MIME-Version: 1.0
X-Received: by 10.107.168.145 with SMTP id e17mr16841433ioj.112.1439139805880; 
	Sun, 09 Aug 2015 10:03:25 -0700 (PDT)
Received: by 10.107.38.79 with HTTP; Sun, 9 Aug 2015 10:03:25 -0700 (PDT)
Received: by 10.107.38.79 with HTTP; Sun, 9 Aug 2015 10:03:25 -0700 (PDT)
In-Reply-To: <1981963.0BZJNaCbRs@peggleto-mobl.ger.corp.intel.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<2404070.xrxV9F6QNR@peggleto-mobl.ger.corp.intel.com>
	<D525FF28-FAA1-4D3F-A4FF-99E60401DC45@gmail.com>
	<1981963.0BZJNaCbRs@peggleto-mobl.ger.corp.intel.com>
Date: Sun, 9 Aug 2015 10:03:25 -0700
Message-ID: <CAMKF1srqaXwG8v+FJz0G2M3ys9ArcWD1fkX_7h3F8z1AZqi3oA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Sun, 09 Aug 2015 17:03:28 -0000
Content-Type: multipart/alternative; boundary=001a1142e4fce97f0c051ce3d862

--001a1142e4fce97f0c051ce3d862
Content-Type: text/plain; charset=UTF-8

On Aug 9, 2015 9:21 AM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:
>
> On Saturday 08 August 2015 11:54:45 Khem Raj wrote:
> > > On Aug 7, 2015, at 12:54 PM, Paul Eggleton <
paul.eggleton@linux.intel.com>
> > > wrote:>
> > > On Friday 07 August 2015 12:26:56 Khem Raj wrote:
> > >>> On Aug 7, 2015, at 2:51 AM, Paul Eggleton
> > >>> <paul.eggleton@linux.intel.com>
> > >>> wrote:>
> > >>>
> > >>> On Thursday 06 August 2015 19:52:28 Khem Raj wrote:
> > >>>> On Thu, Aug 6, 2015 at 2:25 AM, Paul Eggleton
> > >>>>
> > >>>> <paul.eggleton@linux.intel.com> wrote:
> > >>>>> On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
> > >>>>>> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
> > >>>>>>> Added new patch that fixes the memory leak that was introduced
in
> > >>>>>>> mkdosfs-dir.patch.
> > >>>>>>
> > >>>>>> You should update the original patch then, not pile additional
> > >>>>>> patches
> > >>>>>> on top. The least painful way is:
> > >>>>>>
> > >>>>>> 1) unpack the sources (manually from tarball, or using bitbake -c
> > >>>>>> unpack)
> > >>>>>> 2) 'git init; git add *; git commit' to create an git repository
from
> > >>>>>> the sources
> > >>>>>> 3) apply the patch that needs fixing, then do the fix
> > >>>>>> 4) make a git commit, then produce a patch using git
format-patch,
> > >>>>>> then
> > >>>>>> move the new patch back to the recipe directory and update the
recipe
> > >>>>>> 5) build the recipe to make sure it still builds
> > >>>>>> 6) make a git commit with the recipe update, and submit it here
:)
> > >>>>>
> > >>>>> On the contrary - the much less painful way (as of fido) is to use
> > >>>>> devtool:
> > >>>>>
> > >>>>> 1) Extract source and set the build system up to use it:
> > >>>>>  devtool modify dosfstools -x ~/projects/dosfstools
> > >>>>>
> > >>>>> 2) Make whatever changes you want to in the git tree that has
been set
> > >>>>> up
> > >>>>> in the specified path
> > >>>>>
> > >>>>> 3) Build the recipe (as you would normally) to make sure it still
> > >>>>> builds
> > >>>>>
> > >>>>> 4) Write the modified/added commits as patches back to the recipe:
> > >>>>>   devtool update-recipe dosfstools
> > >>>>>
> > >>>>> 5) Make a git commit with the recipe update, and submit it here :)
> > >>>>>
> > >>>>> I'd really like people to start using devtool for this kind of
thing.
> > >>>>> If
> > >>>>> it's not working for some reason please do let me know.
> > >>>>
> > >>>> This assumes either we use OE-Core or poky, I dont get it to work
with
> > >>>> angstrom out of box
> > >>>> what am I missing
> > >>>
> > >>> Well, whatever error / problem you are experiencing seems to be
missing
> > >>> at
> > >>> least ;)
> > >>
> > >> devtool modify dosfstools -x ~/projects/dosfstools
> > >> ERROR: This script can only be run after initialising the build
> > >> environment
> > >> (e.g. by using oe-init-build-env)
> > >>
> > >> so is it must now to use the setup script ? or can be extract some
needed
> > >> setup from it to let it work with setups not using the init script
> > >
> > > Well it needs to be able to run bitbake internally (directly and using
> > > tinfoil), hence the need to have the environment set up to do so. I
don't
> > > really see a way around that.
> >
> > Then limited use of  devtool should be documented as available
>
> How is this limited? It operates under the same conditions as bitbake
itself
> does.

Your last email indicated as if it always needs internal build environment.
If that's not the case then it's what I was requesting for the settings
that are required to execute it provided bitbake is in path and is building
fine but it's not using the settings provided by setup environment script
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

--001a1142e4fce97f0c051ce3d862
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 9, 2015 9:21 AM, &quot;Paul Eggleton&quot; &lt;<a href=3D"mailto:pau=
l.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On Saturday 08 August 2015 11:54:45 Khem Raj wrote:<br>
&gt; &gt; &gt; On Aug 7, 2015, at 12:54 PM, Paul Eggleton &lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<b=
r>
&gt; &gt; &gt; wrote:&gt;<br>
&gt; &gt; &gt; On Friday 07 August 2015 12:26:56 Khem Raj wrote:<br>
&gt; &gt; &gt;&gt;&gt; On Aug 7, 2015, at 2:51 AM, Paul Eggleton<br>
&gt; &gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com"=
>paul.eggleton@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt; wrote:&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; On Thursday 06 August 2015 19:52:28 Khem Raj wrote:<=
br>
&gt; &gt; &gt;&gt;&gt;&gt; On Thu, Aug 6, 2015 at 2:25 AM, Paul Eggleton<br=
>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.=
com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; On Thursday 06 August 2015 12:12:35 Alexande=
r Kanavin wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; On 08/06/2015 12:06 PM, Amarnath Valluri=
 wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Added new patch that fixes the memor=
y leak that was introduced in<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; mkdosfs-dir.patch.<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; You should update the original patch the=
n, not pile additional<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; patches<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; on top. The least painful way is:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; 1) unpack the sources (manually from tar=
ball, or using bitbake -c<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; unpack)<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; 2) &#39;git init; git add *; git commit&=
#39; to create an git repository from<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; the sources<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; 3) apply the patch that needs fixing, th=
en do the fix<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; 4) make a git commit, then produce a pat=
ch using git format-patch,<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; then<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; move the new patch back to the recipe di=
rectory and update the recipe<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; 5) build the recipe to make sure it stil=
l builds<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; 6) make a git commit with the recipe upd=
ate, and submit it here :)<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; On the contrary - the much less painful way =
(as of fido) is to use<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; devtool:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 1) Extract source and set the build system u=
p to use it:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 devtool modify dosfstools -x ~/project=
s/dosfstools<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 2) Make whatever changes you want to in the =
git tree that has been set<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; up<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; in the specified path<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 3) Build the recipe (as you would normally) =
to make sure it still<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; builds<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 4) Write the modified/added commits as patch=
es back to the recipe:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0devtool update-recipe dosfstools=
<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 5) Make a git commit with the recipe update,=
 and submit it here :)<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; I&#39;d really like people to start using de=
vtool for this kind of thing.<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; If<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; it&#39;s not working for some reason please =
do let me know.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; This assumes either we use OE-Core or poky, I do=
nt get it to work with<br>
&gt; &gt; &gt;&gt;&gt;&gt; angstrom out of box<br>
&gt; &gt; &gt;&gt;&gt;&gt; what am I missing<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Well, whatever error / problem you are experiencing =
seems to be missing<br>
&gt; &gt; &gt;&gt;&gt; at<br>
&gt; &gt; &gt;&gt;&gt; least ;)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; devtool modify dosfstools -x ~/projects/dosfstools<br>
&gt; &gt; &gt;&gt; ERROR: This script can only be run after initialising th=
e build<br>
&gt; &gt; &gt;&gt; environment<br>
&gt; &gt; &gt;&gt; (e.g. by using oe-init-build-env)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; so is it must now to use the setup script ? or can be ex=
tract some needed<br>
&gt; &gt; &gt;&gt; setup from it to let it work with setups not using the i=
nit script<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Well it needs to be able to run bitbake internally (directly=
 and using<br>
&gt; &gt; &gt; tinfoil), hence the need to have the environment set up to d=
o so. I don&#39;t<br>
&gt; &gt; &gt; really see a way around that.<br>
&gt; &gt;<br>
&gt; &gt; Then limited use of=C2=A0 devtool should be documented as availab=
le<br>
&gt;<br>
&gt; How is this limited? It operates under the same conditions as bitbake =
itself<br>
&gt; does.</p>
<p dir=3D"ltr">Your last email indicated as if it always needs internal bui=
ld environment. If that&#39;s not the case then it&#39;s what I was request=
ing for the settings that are required to execute it provided bitbake is in=
 path and is building fine but it&#39;s not using the settings provided by =
setup environment script<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Paul Eggleton<br>
&gt; Intel Open Source Technology Centre<br>
</p>

--001a1142e4fce97f0c051ce3d862--
