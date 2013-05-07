Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rwmacleod@gmail.com>) id 1UZZFh-0005Hg-1a
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 06:11:48 +0200
Received: by mail-wg0-f47.google.com with SMTP id e11so130461wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2013 20:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dD20SitBc7QV6TeschK96Yuy1fQswgRxTUuj2K3xMII=;
	b=qOuE/dw5Fn3SlY1t+7TouCeSbQwCd+ypANBO9w/o2pkUn4pw3LqDB9sXXjilf63anc
	TWzjgtTLFFxoFPOQI2vk8i95Qwk6BX9SQ1Y4ahkWebbFGKallzIbIGirbBd/wXAaKOf9
	oIVlj4+Y0UsNBh+pKH6SB96rwDamN+DmxogCCg8+YMqNNz+U6ZcktBGHMInkBDpO4fBq
	cJ2yW0ra0UEOrBFhGnvnF6JQ40os9aEXWydRBOV4t6zjTugnAh3Hw+KV8D4Q3bP0FlAk
	l2A2WjMWdSNsoI1maoyMzNLKY0n5WNniRUP4xew56gqvsh7S64NCOtTr0FIeTZjpnv8J
	dF4w==
MIME-Version: 1.0
X-Received: by 10.194.109.136 with SMTP id hs8mr354982wjb.8.1367898823566;
	Mon, 06 May 2013 20:53:43 -0700 (PDT)
Received: by 10.194.94.233 with HTTP; Mon, 6 May 2013 20:53:43 -0700 (PDT)
In-Reply-To: <51882798.9080208@linux.intel.com>
References: <CAK6=ix4EGtoEd0JqEBC6tNt+nXVEw5=F_Mf3vUFCzKeCEq8kzg@mail.gmail.com>
	<51882798.9080208@linux.intel.com>
Date: Mon, 6 May 2013 23:53:43 -0400
Message-ID: <CAK6=ix4tT9WpDy0HXBQdKBtVE9anCJJjTntP+QYY=vSMOiQbng@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/18] pkgconfig: Move patches in prep for 0.28 update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 04:11:54 -0000
Content-Type: multipart/alternative; boundary=089e0102e17277ab0c04dc18c3b7

--089e0102e17277ab0c04dc18c3b7
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 6, 2013 at 5:58 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/06/2013 01:59 PM, Randy MacLeod wrote:
>
>> On 13-04-24 05:37 PM, Saul Wold wrote:> Signed-off-by: Saul Wold
>> <sgw@linux.intel.com <mailto:sgw@linux.intel.com>>
>>
>>  > ---
>>  >   meta/recipes-devtools/**pkgconfig/pkgconfig.inc     | 8 +-------
>>  >   meta/recipes-devtools/**pkgconfig/pkgconfig_0.25.bb
>> <http://pkgconfig_0.25.bb> | 7 +++++++
>>
>>  >   2 files changed, 8 insertions(+), 7 deletions(-)
>>
>> Saul,
>>
>> Any news on pkgconfig-0.28 ? I'm trying to compile c-i-m
>> using clang for the -native tools and glib-1.2.10 shipped with
>> pkgconfig-0.25 is causing the build error below.
>> pkgconfig-0.28 and later includes version of glib-2.32.4
>>
>>  Got caught up in 1.4 finalization and planning for 1.5, I was going to
> look at it again this week.
>
>
>  If you are about to push this uprev, I'll wait a while and try
>> again. Do you want help?
>>
>>  I would appreciate help with the update if you can provide a tested
> pkgconfig update, I was thinking about providing the update for testing
> before enabling it similar to what we do with gcc, that's why I split the
> recipe.
>
> I have an untested version (it builds) in my poky-contrib/sgw/wip branch
> with you want to finish/test it more.
>

I only see 0.25:

$ cd .../poky/poky-contrib.git
$ git pull
Already up-to-date.
$ git status
# On branch sgw/wip
nothing to commit, working directory clean
$ find meta -name "pkgcon*bb"
meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
meta/recipes-devtools/pkgconfig/pkgconfig_git.bb

Did I miss something?

I think you want me to provide a commit for 0.28 as an additional recipe
with the
preferred provider being 0.25 until 0.28 is tested and stable. Is that
right?

Thanks for your help.
>

Let's not get ahead of ourselves. :)
I'm also in the middle of planning so we'll see how much time I have to
work on this. :) I've made some progress on groking the existing patches
and determining which ones should be kept, adjusted and tossed. More
tomorrow night - I hope.


Current status:
- removed all the pkgconfig-0.28/*patches - I'm not sure I can really get
away with that.
- configure is failing as shown below.


// Randy

$ bitbake -c configure pkgconfig-native
....
| system_include_path='/usr/include'
| system_library_path='/usr/lib:/lib'
| target_alias='x86_64-linux'
| use_indirect_deps='no'
|
| configure: exit 1
| ERROR: oe_runconf failed
| ERROR: Function failed: do_configure (see
/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.28-r0/temp/log.do_configure.15370
for further information)
ERROR: Task 26
(virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig/
pkgconfig_0.28.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 46 tasks of which 42 didn't need to be rerun
and 1 failed.
No currently running tasks (46 of 63)

Summary: 1 task failed:

virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig/
pkgconfig_0.28.bb, do_configure


-- 
../Randy/..

--089e0102e17277ab0c04dc18c3b7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, May 6, 2013 at 5:58 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 05/06/2013 01:59 PM, Randy MacLeod wr=
ote:<br>

</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div class=3D"im">
On 13-04-24 05:37 PM, Saul Wold wrote:&gt; Signed-off-by: Saul Wold<br></di=
v>
&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.inte=
l.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blan=
k">sgw@linux.intel.com</a>&gt;&gt;<div class=3D"im"><br>
=A0&gt; ---<br>
=A0&gt; =A0 meta/recipes-devtools/<u></u>pkgconfig/pkgconfig.inc =A0 =A0 | =
8 +-------<br>
=A0&gt; =A0 meta/recipes-devtools/<u></u>pkgconfig/<a href=3D"http://pkgcon=
fig_0.25.bb" target=3D"_blank">pkgconfig_0.25.bb</a><br></div>
&lt;<a href=3D"http://pkgconfig_0.25.bb" target=3D"_blank">http://pkgconfig=
_0.25.bb</a>&gt; | 7 +++++++<div class=3D"im"><br>
=A0&gt; =A0 2 files changed, 8 insertions(+), 7 deletions(-)<br>
<br>
Saul,<br>
<br>
Any news on pkgconfig-0.28 ? I&#39;m trying to compile c-i-m<br>
using clang for the -native tools and glib-1.2.10 shipped with<br>
pkgconfig-0.25 is causing the build error below.<br>
pkgconfig-0.28 and later includes version of glib-2.32.4<br>
<br>
</div></blockquote>
Got caught up in 1.4 finalization and planning for 1.5, I was going to look=
 at it again this week.<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
If you are about to push this uprev, I&#39;ll wait a while and try<br>
again. Do you want help?<br>
<br>
</blockquote></div>
I would appreciate help with the update if you can provide a tested pkgconf=
ig update, I was thinking about providing the update for testing before ena=
bling it similar to what we do with gcc, that&#39;s why I split the recipe.=
<br>

<br>
I have an untested version (it builds) in my poky-contrib/sgw/wip branch wi=
th you want to finish/test it more.<br></blockquote><div><br></div><div sty=
le>I only see 0.25:</div><div style><br></div><div style>$ cd .../poky/poky=
-contrib.git=A0</div>
<div style><div>$ git pull</div><div>Already up-to-date.</div><div>$ git st=
atus</div><div># On branch sgw/wip</div><div>nothing to commit, working dir=
ectory clean</div><div>$ find meta -name &quot;pkgcon*bb&quot;</div><div>
meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_0.25.bb">pkgcon=
fig_0.25.bb</a></div><div>meta/recipes-devtools/pkgconfig/<a href=3D"http:/=
/pkgconfig_git.bb">pkgconfig_git.bb</a></div><div><br></div></div><div styl=
e>
Did I miss something?</div><div style><br></div><div style>I think you want=
 me to provide a commit for 0.28 as an additional recipe with the=A0</div><=
div style>preferred provider being 0.25 until 0.28 is tested and stable. Is=
 that right?</div>
<div style><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">
Thanks for your help.<br></blockquote><div><br></div><div style>Let&#39;s n=
ot get ahead of ourselves. :)</div><div style>I&#39;m also in the middle of=
 planning so we&#39;ll see how much time I have to work on this. :) I&#39;v=
e made some progress on groking the existing patches and determining which =
ones should be kept, adjusted and tossed. More tomorrow night - I hope.</di=
v>
<div style><br></div><div style><br></div><div style>Current status:=A0</di=
v><div style>- removed all the pkgconfig-0.28/*patches - I&#39;m not sure I=
 can really get away with that.</div><div style>- configure is failing as s=
hown below.</div>
<div style><br></div><div style><br></div><div style>// Randy</div><div sty=
le><div><br></div><div style>$ bitbake -c configure=A0pkgconfig-native</div=
><div>....</div><div>| system_include_path=3D&#39;/usr/include&#39;</div><d=
iv>
| system_library_path=3D&#39;/usr/lib:/lib&#39;</div><div>| target_alias=3D=
&#39;x86_64-linux&#39;</div><div>| use_indirect_deps=3D&#39;no&#39;</div><d=
iv>|=A0</div><div>| configure: exit 1</div><div>| ERROR: oe_runconf failed<=
/div>
<div>| ERROR: Function failed: do_configure (see /home/rmacleod/src/distro/=
yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.28-r0/t=
emp/log.do_configure.15370 for further information)</div><div>ERROR: Task 2=
6 (virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-=
devtools/pkgconfig/<a href=3D"http://pkgconfig_0.28.bb">pkgconfig_0.28.bb</=
a>, do_configure) failed with exit code &#39;1&#39;</div>
<div>NOTE: Tasks Summary: Attempted 46 tasks of which 42 didn&#39;t need to=
 be rerun and 1 failed.</div><div>No currently running tasks (46 of 63)</di=
v><div><br></div><div>Summary: 1 task failed:</div><div>=A0 virtual:native:=
/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig=
/<a href=3D"http://pkgconfig_0.28.bb">pkgconfig_0.28.bb</a>, do_configure</=
div>
<div><br></div></div></div><div><br></div>-- <br>../Randy/..
</div></div>

--089e0102e17277ab0c04dc18c3b7--
