Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RC3Qp-0004pD-7q
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 07:57:15 +0200
Received: by vwe42 with SMTP id 42so3059735vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=S9yUL+L3ADXnpIIuFRfG+XnMOfFlaeKsrTkrODoH+OA=;
	b=Q9XIqJfnTEVq386VrVEJIupfRPLhQXMLZ5nOg9DpW4NbodIupU1lsA2aHEOU4jmxqK
	KW2yazVVpkiPBZQqblnNWztkS9qQxZbESXk7oXTUhEuRRTrrXNBmNNAa0VmjZ/2gF6dN
	G2E8Qs7pKsjDr8bqWUjSuPRlb+H8inYW7TgPg=
MIME-Version: 1.0
Received: by 10.52.67.84 with SMTP id l20mr1154766vdt.73.1317966697889; Thu,
	06 Oct 2011 22:51:37 -0700 (PDT)
Received: by 10.52.186.162 with HTTP; Thu, 6 Oct 2011 22:51:37 -0700 (PDT)
In-Reply-To: <4E8CDF5C.7050008@intel.com>
References: <4E8B6564.4090002@balister.org> <4E8B67C5.8050602@intel.com>
	<4E8B6C17.80509@balister.org> <4E8B6D47.9000600@intel.com>
	<4E8B8C05.5050508@windriver.com> <4E8C662B.4090300@balister.org>
	<CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
	<4E8CB801.7050003@balister.org> <4E8CDF5C.7050008@intel.com>
Date: Fri, 7 Oct 2011 07:51:37 +0200
Message-ID: <CACW_hTYMOLUgL-OGy3rJUGnkaBEOsRxdF3anerUt2x+HhSMT6A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Fri, 07 Oct 2011 05:57:15 -0000
Content-Type: multipart/alternative; boundary=20cf307d012ada80d904aeaf08c6

--20cf307d012ada80d904aeaf08c6
Content-Type: text/plain; charset=ISO-8859-1

2011/10/6 Saul Wold <saul.wold@intel.com>

> On 10/05/2011 01:03 PM, Philip Balister wrote:
>
>> On 10/05/2011 03:35 PM, Khem Raj wrote:
>>
>>> On Wed, Oct 5, 2011 at 7:14 AM, Philip Balister<philip@balister.org>
>>> wrote:
>>>
>>>>
>>>> 1) I do not want rpm in the image. This would confuse my customer base.
>>>> 2) I am tired of dropbear, I want openssh only.
>>>> 3) I need the full versions of tools, not the busybox ones.
>>>> 4) I am not limited to gpv2 software.
>>>>
>>>> Richard, it looks to me like we should add an item for the next Yocto
>>>> development cycle to review how images are built and try to make the
>>>> base
>>>> stuff in oe-core more usable by everyone. We need to define what
>>>> choices are
>>>> made by distros. For example opkg, rpm, no package management in image.
>>>> Images may want dropbear or openssh.
>>>>
>>>> Short term, I think I'll copy the tasks/images into my bsp and get some
>>>> stuff together for testing. I'd like a better long term solution though.
>>>>
>>>
>>> There always will be customizations needed. But we can strive for
>>> better basic blocks
>>>
>>
>> Sure. The immediate things I noticed are rpm being installed and lack of
>> a way to chose between dropbear/openssh.
>>
>> I think it is worth having a conversation to find out if when can make
>> it easier for users to create images, with a small number of knobs to
>> turn.
>>
>>  I agree, your 4 items above make sense and we could create a set of tasks
> that can be use it as building blocks, I think that task-core-basic could be
> a starting point for that.
>
> We did work to enable the selection of either openssh/dropbear but at an
> IMAGE_FEATURE level, not as a DISTRO_FEATURE or virtual.
>
> Let's see what you come up with for your tasks and we can go from there.
>
> Thanks
> Sau!
>
> The usability of tasks in general greatly depends on the use case you are
in.
To give an idea of our use case.
We make embedded systems to which the user only can interact in a specified
way. No online upgrading of packages let alone installing new ones (actually
some of the boards do not even have a network interface).
As we are limited on flash space our images are hand crafted, only to
contain those packages that we really need.
Wrt kernel: we hardly use modules, almost everything is configured into the
kernel (as we exactly know our hardware).

Then again if you have more space and or need to be more flexible tasks
definitely can have their merits. (especially when mapping machine features
to kernel modules etc).

For the specific case with dropbear.
OE classic task-base.bb contained
DISTRO_SSH_DAEMON ?= "dropbear"
and then used the variable in the image list
OE classic task-poky.bb hardcoded dropbear.

Personally I don't really see too much value in having the package in a var.
It is more work to type ${DISTRO_SSH_DAEMON} in the IMAGE-INSTALL than it is
to type dropbear or openssh.

Frans

--20cf307d012ada80d904aeaf08c6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/10/6 Saul Wold <span dir=3D"ltr">&l=
t;<a href=3D"mailto:saul.wold@intel.com">saul.wold@intel.com</a>&gt;</span>=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On 10/05/2011 01:03 PM, Philip Balister wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 10/05/2011 03:35 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Oct 5, 2011 at 7:14 AM, Philip Balister&lt;<a href=3D"mailto:philip=
@balister.org" target=3D"_blank">philip@balister.org</a>&gt;<br>
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
1) I do not want rpm in the image. This would confuse my customer base.<br>
2) I am tired of dropbear, I want openssh only.<br>
3) I need the full versions of tools, not the busybox ones.<br>
4) I am not limited to gpv2 software.<br>
<br>
Richard, it looks to me like we should add an item for the next Yocto<br>
development cycle to review how images are built and try to make the<br>
base<br>
stuff in oe-core more usable by everyone. We need to define what<br>
choices are<br>
made by distros. For example opkg, rpm, no package management in image.<br>
Images may want dropbear or openssh.<br>
<br>
Short term, I think I&#39;ll copy the tasks/images into my bsp and get some=
<br>
stuff together for testing. I&#39;d like a better long term solution though=
.<br>
</blockquote>
<br>
There always will be customizations needed. But we can strive for<br>
better basic blocks<br>
</blockquote>
<br>
Sure. The immediate things I noticed are rpm being installed and lack of<br=
>
a way to chose between dropbear/openssh.<br>
<br>
I think it is worth having a conversation to find out if when can make<br>
it easier for users to create images, with a small number of knobs to turn.=
<br>
<br>
</blockquote></div>
I agree, your 4 items above make sense and we could create a set of tasks t=
hat can be use it as building blocks, I think that task-core-basic could be=
 a starting point for that.<br>
<br>
We did work to enable the selection of either openssh/dropbear but at an IM=
AGE_FEATURE level, not as a DISTRO_FEATURE or virtual.<br>
<br>
Let&#39;s see what you come up with for your tasks and we can go from there=
.<br>
<br>
Thanks<br>
Sau!<div><div></div><div class=3D"h5"><br></div></div></blockquote></div>Th=
e usability of tasks in general greatly depends on the use case you are in.=
<br>To give an idea of our use case.<br>We make embedded systems to which t=
he user only can interact in a specified way. No online upgrading of packag=
es let alone installing new ones (actually some of the boards do not even h=
ave a network interface).<br>
As we are limited on flash space our images are hand crafted, only to conta=
in those packages that we really need.<br>Wrt kernel: we hardly use modules=
, almost everything is configured into the kernel (as we exactly know our h=
ardware).<br>
<br>Then again if you have more space and or need to be more flexible tasks=
 definitely can have their merits. (especially when mapping machine feature=
s to kernel modules etc).<br><br>For the specific case with dropbear.<br>
OE classic <a href=3D"http://task-base.bb">task-base.bb</a> contained<br>DI=
STRO_SSH_DAEMON ?=3D &quot;dropbear&quot;<br>and then used the variable in =
the image list<br>OE classic <a href=3D"http://task-poky.bb">task-poky.bb</=
a> hardcoded dropbear.<br>
<br>Personally I don&#39;t really see too much value in having the package =
in a var.<br>It is more work to type ${DISTRO_SSH_DAEMON} in the IMAGE-INST=
ALL than it is to type dropbear or openssh.<br><br>Frans<br>

--20cf307d012ada80d904aeaf08c6--
