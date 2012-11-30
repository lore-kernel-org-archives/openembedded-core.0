Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TeUZl-0001js-Ep
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 18:40:33 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so618837lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BE/xf1vW8EuJOxxJb7upv7dTTYqBx0yQTWKGGQxMzGI=;
	b=p7g9v4UY/amwFymc/DsAcjMEgBRra28kav+dWtPXRbRc/8hRrXEvut+Suebk4OQpJp
	O3acbcnNodl/y4RgCxpIccrSDq3XkdAdzPzL+Dlip3+ByR830AiCldRs2JvKt9KfQeH0
	uY8EYALGH1BtYNyNQexI2jVq3O66y4DGQMjp8hRNf6l5neSWOpMBXiIrJHlt1+A0biz9
	dXBq5fHaq7Vi58VeAh6lllieVvuQcs5eod/LNPPNk/OkiRwY1vwaSmanQQW2xzN/xneQ
	GIA23HFi1b1tUSk8DZCHisY3KktC79RpsSvZ6m6j0He8XoHYpfXKAb611aEJ+PTA4L4k
	qnMw==
MIME-Version: 1.0
Received: by 10.152.104.148 with SMTP id ge20mr1905710lab.51.1354296376099;
	Fri, 30 Nov 2012 09:26:16 -0800 (PST)
Received: by 10.114.17.8 with HTTP; Fri, 30 Nov 2012 09:26:16 -0800 (PST)
In-Reply-To: <50B8E999.2050109@linux.intel.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
Date: Fri, 30 Nov 2012 12:26:16 -0500
Message-ID: <CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
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
X-List-Received-Date: Fri, 30 Nov 2012 17:40:33 -0000
Content-Type: multipart/alternative; boundary=f46d040711696b030e04cfb9b2b5

--f46d040711696b030e04cfb9b2b5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 11/30/2012 03:29 AM, David Nystr=F6m wrote:
>
>> On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>
>>> On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>>
>>>> Thanks for looping me in here David. The initial goal for the meta-xen
>>>> layer was in fact to encompass Xen Cloud Platform.  As such, the inten=
t
>>>> was to contain both hypervisor and user-space applications.  Indeed, t=
he
>>>> xen distribution itself includes xm/libxl; hypervisor abstraction woul=
d
>>>> be somewhat tedious in my opinion.
>>>>
>>>> The layer just received commits for expanding the libvirt build to
>>>> support qemu.  The commonalities and shared packaged between xen, qemu=
,
>>>> and kvm implementations are such that I would also agree that meta-xen
>>>> should be expanded/renamed to encompass all virtualization types; I al=
so
>>>> support the move to meta-virtualization.
>>>>
>>>>
>> meta-virtualization sounds good, let co-op on this so we don't duplicate
>> work.
>>
>>  If everyone is OK with this, I will have Michael Halstead create a repo=
,
> please send him your keys so that you will have write access to it.
>

This works for me. If Michael already has our keys, do we need to resend or
can
a local copy happen ?

Cheers,

Bruce


>
> Sau!
>
>
>  As far as a meta-cloud layer is concerned, I'm not sure I am
>>>> knowledgeable enough in this area to weigh in.  I'm currently
>>>> researching a filesystem implementation for OpenStack and have stumble=
d
>>>> across Ceph/RBD and Gluster modules that look promising. On top of thi=
s,
>>>> XCP is documented to include support for VastSky and can be integrated
>>>> with DRBD.  And, the storage and hypervisor are only two pieces of the
>>>> puzzle for a cloud implementation!
>>>>
>>>>
>> Cool !
>> I know, the meta-"cloud" name is quite/too ambitious, it was not meant
>> to be a one week effort. But why aim low :).
>>
>>  I think I would encourage you to also include OpenStack in a
>>>> meta-virtualization layer until it has matured to the point where
>>>> abstraction is more warranted.
>>>>
>>>
>> Agree.
>>
>>  Since you've already created a presence
>>>> at github, would it be possible to rename your layer to
>>>> meta-virtualization and absorb the entire meta-xen layer?  I can push
>>>> any changes for Xen/XCP here, it sounds like it is a central place for
>>>> libvirt and could also contain Bruce's kernel modifications.
>>>>
>>>> Alternatively, I can create a meta-virtualization project.  In any cas=
e,
>>>> those on the To and CC list should receive access to this layer as a
>>>> starting point.
>>>>
>>>> Just my two cents.  :)
>>>>
>>>
>>> I'd like to offer to host this combined layer (whatever we decide to
>>> call it) on git.yoctoproject.org if that would help people and people
>>> are interested. My only concern is in the area of maintainership, we
>>> need to clearly define who maintains what and what the patch submission
>>> process is in the README.
>>>
>>>
>> Thanks,
>>
>> Sounds good to centralize everything, since Raymond is the majority code
>> contributor, perhaps he, if willing, can maintain the
>> meta-virtualization layer.
>> If you want a co/sub-maintainer I'll be happy to help out.
>>
>>
>>  Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>> ______________________________**_________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.open=
embedded.org>
>>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>>> openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/o=
penembedded-core>
>>>
>>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.opene=
mbedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-cor=
e<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>
>>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openem=
bedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core=
<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d040711696b030e04cfb9b2b5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, N=
ov 30, 2012 at 12:15 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:=
sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 11/30/2012 03:29 AM, Da=
vid Nystr=F6m wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 11/29/2012 02:54 PM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Thanks for looping me in here David. The initial goal for the meta-xen<br>
layer was in fact to encompass Xen Cloud Platform. =A0As such, the intent<b=
r>
was to contain both hypervisor and user-space applications. =A0Indeed, the<=
br>
xen distribution itself includes xm/libxl; hypervisor abstraction would<br>
be somewhat tedious in my opinion.<br>
<br>
The layer just received commits for expanding the libvirt build to<br>
support qemu. =A0The commonalities and shared packaged between xen, qemu,<b=
r>
and kvm implementations are such that I would also agree that meta-xen<br>
should be expanded/renamed to encompass all virtualization types; I also<br=
>
support the move to meta-virtualization.<br>
<br>
</blockquote></blockquote>
<br>
meta-virtualization sounds good, let co-op on this so we don&#39;t duplicat=
e<br>
work.<br>
<br>
</blockquote></div>
If everyone is OK with this, I will have Michael Halstead create a repo, pl=
ease send him your keys so that you will have write access to it.<br></bloc=
kquote><div><br></div><div>This works for me. If Michael already has our ke=
ys, do we need to resend or can</div>
<div>a local copy happen ?</div><div><br></div><div>Cheers,</div><div><br><=
/div><div>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

As far as a meta-cloud layer is concerned, I&#39;m not sure I am<br>
knowledgeable enough in this area to weigh in. =A0I&#39;m currently<br>
researching a filesystem implementation for OpenStack and have stumbled<br>
across Ceph/RBD and Gluster modules that look promising. On top of this,<br=
>
XCP is documented to include support for VastSky and can be integrated<br>
with DRBD. =A0And, the storage and hypervisor are only two pieces of the<br=
>
puzzle for a cloud implementation!<br>
<br>
</blockquote></blockquote>
<br>
Cool !<br>
I know, the meta-&quot;cloud&quot; name is quite/too ambitious, it was not =
meant<br>
to be a one week effort. But why aim low :).<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I think I would encourage you to also include OpenStack in a<br>
meta-virtualization layer until it has matured to the point where<br>
abstraction is more warranted.<br>
</blockquote></blockquote>
<br>
Agree.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Since you&#39;ve already created a presence<br>
at github, would it be possible to rename your layer to<br>
meta-virtualization and absorb the entire meta-xen layer? =A0I can push<br>
any changes for Xen/XCP here, it sounds like it is a central place for<br>
libvirt and could also contain Bruce&#39;s kernel modifications.<br>
<br>
Alternatively, I can create a meta-virtualization project. =A0In any case,<=
br>
those on the To and CC list should receive access to this layer as a<br>
starting point.<br>
<br>
Just my two cents. =A0:)<br>
</blockquote>
<br>
I&#39;d like to offer to host this combined layer (whatever we decide to<br=
>
call it) on <a href=3D"http://git.yoctoproject.org" target=3D"_blank">git.y=
octoproject.org</a> if that would help people and people<br>
are interested. My only concern is in the area of maintainership, we<br>
need to clearly define who maintains what and what the patch submission<br>
process is in the README.<br>
<br>
</blockquote>
<br>
Thanks,<br>
<br>
Sounds good to centralize everything, since Raymond is the majority code<br=
>
contributor, perhaps he, if willing, can maintain the<br>
meta-virtualization layer.<br>
If you want a co/sub-maintainer I&#39;ll be happy to help out.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
</blockquote>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--f46d040711696b030e04cfb9b2b5--
