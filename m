Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ter7r-0002e2-5B
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 18:45:15 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1091444lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2012 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9YTBvDcm+JyhVDT5VHlkx8RoAzJ5Q4PVbEOZ4sUP1y4=;
	b=bck4B8YAPjuVKO0wsjomvHIQU/490wkhKGTw1e9hHPIZT2ZwI4XnO6fe/BlRrzN9U/
	UTSV2h++HrrIVPKu8cs0+qmJI5m4GsGH9zeGX2q33oQTmcDYiT/sdvgb3wSmurwOIqQG
	WkS0ySlECpl1OkDHgEsLJdyTzDS2vb/kwoitxkk2Ypy8HpwjTejrKbje200oCWj7acn+
	lM4h6HPGa/vTIqIZArWaU/l82WDju0tJSzI9wSyZ8OBWNt5yQFRHVCyzEdRKhuMrW/ps
	xz+OK6wmHg76lTmDAW7UW+ApocZOEZDYUjy9YuZMSuBSEY/1djBVXm5zbfEG2MXuT1ag
	cZLg==
MIME-Version: 1.0
Received: by 10.152.104.148 with SMTP id ge20mr4622305lab.51.1354383056242;
	Sat, 01 Dec 2012 09:30:56 -0800 (PST)
Received: by 10.114.17.8 with HTTP; Sat, 1 Dec 2012 09:30:56 -0800 (PST)
In-Reply-To: <50B93FFB.9050505@yoctoproject.org>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
	<50B93FFB.9050505@yoctoproject.org>
Date: Sat, 1 Dec 2012 12:30:56 -0500
Message-ID: <CADkTA4Nd0-bB2XHT9axsp7xfehcL3swks9q7mMXM+q5oVfDY_g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Michael Halstead <michael@yoctoproject.org>
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
X-List-Received-Date: Sat, 01 Dec 2012 17:45:15 -0000
Content-Type: multipart/alternative; boundary=f46d04071169f5073e04cfcde077

--f46d04071169f5073e04cfcde077
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 6:23 PM, Michael Halstead
<michael@yoctoproject.org>wrote:

>  On 11/30/2012 12:17 PM, Raymond Danks wrote:
>
> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>
> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>
>
>
>
> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 11/30/2012 03:29 AM, David Nystr=F6m wrote:
>>
>>> On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>
>>>> On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>>>
>>>>> Thanks for looping me in here David. The initial goal for the meta-xe=
n
>>>>> layer was in fact to encompass Xen Cloud Platform.  As such, the inte=
nt
>>>>> was to contain both hypervisor and user-space applications.  Indeed,
>>>>> the
>>>>> xen distribution itself includes xm/libxl; hypervisor abstraction wou=
ld
>>>>> be somewhat tedious in my opinion.
>>>>>
>>>>> The layer just received commits for expanding the libvirt build to
>>>>> support qemu.  The commonalities and shared packaged between xen, qem=
u,
>>>>> and kvm implementations are such that I would also agree that meta-xe=
n
>>>>> should be expanded/renamed to encompass all virtualization types; I
>>>>> also
>>>>> support the move to meta-virtualization.
>>>>>
>>>>>
>>> meta-virtualization sounds good, let co-op on this so we don't duplicat=
e
>>> work.
>>>
>>>  If everyone is OK with this, I will have Michael Halstead create a
>> repo, please send him your keys so that you will have write access to it=
.
>>
>
>  This works for me. If Michael already has our keys, do we need to resend
> or can
> a local copy happen ?
>
> I already have keys for,
>
> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>
> Either of you can currently add
> git@git.yoctoproject.org:meta-virtualization as a git remote and start
> the repository. Once we have initial code and the maintainers and patch
> submission guidelines in the readme I can publicly list the new repositor=
y.
>
> I require an ssh public key for Raymond Danks.
>
> Thanks Michael.  I got your response and was able to push meta-xen to the
> newly created repository on meta-virtualization.  I added one commit to
> tweak the README and conf/layer.conf for the new name.
>
>
>
> We also need a short description for the listing on git.yoctoproject.org.
> I could be something similar to, but better than, "Layer enabling
> virtualization support. "
>
> How about "Layer enabling hypervisor, virtualization tool stack, and clou=
d
> support."
>
>  Sounds good to me. Thank you.
>
>  Also - I referenced the mail alias meta-virtualization at yoctoproject i=
n
> the README.  When you publish this, can we use something like that as wel=
l?
>
>  I can add a private list for meta-virtualization@yoctoproject.org. Who
> shall I add to membership?
>
>

At the risk of stating the obvious, I like the idea of a separate list, and
would like to be
added. But then again, i can always add myself later as well (assuming the
same
interface as the rest of the lists).

Cheers,

Bruce


>
>
> --
> Michael Halstead
> Yocto Project / Sys Admin
>
>
>
>  Thanks again,
> Ray
>
>
> --
> Michael Halstead
> Yocto Project / Sys Admin
>
>
>
>  Cheers,
>
>  Bruce
>
>
>>
>> Sau!
>>
>>
>>   As far as a meta-cloud layer is concerned, I'm not sure I am
>>>>> knowledgeable enough in this area to weigh in.  I'm currently
>>>>> researching a filesystem implementation for OpenStack and have stumbl=
ed
>>>>> across Ceph/RBD and Gluster modules that look promising. On top of
>>>>> this,
>>>>> XCP is documented to include support for VastSky and can be integrate=
d
>>>>> with DRBD.  And, the storage and hypervisor are only two pieces of th=
e
>>>>> puzzle for a cloud implementation!
>>>>>
>>>>>
>>> Cool !
>>> I know, the meta-"cloud" name is quite/too ambitious, it was not meant
>>> to be a one week effort. But why aim low :).
>>>
>>>  I think I would encourage you to also include OpenStack in a
>>>>> meta-virtualization layer until it has matured to the point where
>>>>> abstraction is more warranted.
>>>>>
>>>>
>>> Agree.
>>>
>>>  Since you've already created a presence
>>>>> at github, would it be possible to rename your layer to
>>>>> meta-virtualization and absorb the entire meta-xen layer?  I can push
>>>>> any changes for Xen/XCP here, it sounds like it is a central place fo=
r
>>>>> libvirt and could also contain Bruce's kernel modifications.
>>>>>
>>>>> Alternatively, I can create a meta-virtualization project.  In any
>>>>> case,
>>>>> those on the To and CC list should receive access to this layer as a
>>>>> starting point.
>>>>>
>>>>> Just my two cents.  :)
>>>>>
>>>>
>>>> I'd like to offer to host this combined layer (whatever we decide to
>>>> call it) on git.yoctoproject.org if that would help people and people
>>>> are interested. My only concern is in the area of maintainership, we
>>>> need to clearly define who maintains what and what the patch submissio=
n
>>>> process is in the README.
>>>>
>>>>
>>> Thanks,
>>>
>>> Sounds good to centralize everything, since Raymond is the majority cod=
e
>>> contributor, perhaps he, if willing, can maintain the
>>> meta-virtualization layer.
>>> If you want a co/sub-maintainer I'll be happy to help out.
>>>
>>>
>>>  Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
>  --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>
>
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d04071169f5073e04cfcde077
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, N=
ov 30, 2012 at 6:23 PM, Michael Halstead <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:michael@yoctoproject.org" target=3D"_blank">michael@yoctoproject.org<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <div>On 11/30/2012 12:17 PM, Raymond Danks
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>On 11/30/2012 11:03 AM, Michael
        Halstead wrote:<br>
      </div>
      <blockquote type=3D"cite">
       =20
        <div>On 11/30/2012 09:26 AM, Bruce
          Ashfield wrote:<br>
        </div>
        <blockquote type=3D"cite"><br>
          <div class=3D"gmail_extra"><br>
            <br>
            <div class=3D"gmail_quote">On Fri, Nov 30, 2012 at 12:15 PM,
              Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.i=
ntel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span>
              wrote:<br>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
                <div>On 11/30/2012 03:29 AM, David Nystr=F6m
                  wrote:<br>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On 11/29/2012 02:54 PM, Richard Purdie wrote:<br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks
                      wrote:<br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> Thanks for looping me
                        in here David. The initial goal for the meta-xen<br=
>
                        layer was in fact to encompass Xen Cloud
                        Platform. =A0As such, the intent<br>
                        was to contain both hypervisor and user-space
                        applications. =A0Indeed, the<br>
                        xen distribution itself includes xm/libxl;
                        hypervisor abstraction would<br>
                        be somewhat tedious in my opinion.<br>
                        <br>
                        The layer just received commits for expanding
                        the libvirt build to<br>
                        support qemu. =A0The commonalities and shared
                        packaged between xen, qemu,<br>
                        and kvm implementations are such that I would
                        also agree that meta-xen<br>
                        should be expanded/renamed to encompass all
                        virtualization types; I also<br>
                        support the move to meta-virtualization.<br>
                        <br>
                      </blockquote>
                    </blockquote>
                    <br>
                    meta-virtualization sounds good, let co-op on this
                    so we don&#39;t duplicate<br>
                    work.<br>
                    <br>
                  </blockquote>
                </div>
                If everyone is OK with this, I will have Michael
                Halstead create a repo, please send him your keys so
                that you will have write access to it.<br>
              </blockquote>
              <div><br>
              </div>
              <div>This works for me. If Michael already has our keys,
                do we need to resend or can</div>
              <div>a local copy happen ?</div>
            </div>
          </div>
        </blockquote>
        I already have keys for,<br>
        <br>
        David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50<br>
        Bruce Ashfield=A0 4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02<b=
r>
        <br>
        Either of you can currently add <a href=3D"mailto:git@git.yoctoproj=
ect.org:meta-virtualization" target=3D"_blank">git@git.yoctoproject.org:met=
a-virtualization</a>
        as a git remote and start the repository. Once we have initial
        code and the maintainers and patch submission guidelines in the
        readme I can publicly list the new repository.<br>
        <br>
        I require an ssh public key for Raymond Danks.<br>
      </blockquote>
      Thanks Michael.=A0 I got your response and was able to push meta-xen
      to the newly created repository on meta-virtualization.=A0 I added
      one commit to tweak the README and conf/layer.conf for the new
      name.<br>
      <blockquote type=3D"cite"> <br>
        <br>
        We also need a short description for the listing on
        <a href=3D"http://git.yoctoproject.org" target=3D"_blank">git.yocto=
project.org</a>. I could be something similar to, but
        better than, &quot;Layer enabling virtualization support. &quot;<br=
>
      </blockquote>
      How about &quot;Layer enabling hypervisor, virtualization tool stack,
      and cloud support.&quot;<br>
      <br>
    </blockquote></div></div>
    Sounds good to me. Thank you.<div class=3D"im"><br>
    <blockquote type=3D"cite"> Also
      - I referenced the mail alias meta-virtualization at yoctoproject
      in the README.=A0 When you publish this, can we use something like
      that as well?<br>
      <br>
    </blockquote></div>
    I can add a private list for <a href=3D"mailto:meta-virtualization@yoct=
oproject.org" target=3D"_blank">meta-virtualization@yoctoproject.org</a>.
    Who shall I add to membership?<div><div class=3D"h5"><br></div></div></=
div></blockquote><div><br></div><div><br></div><div>At the risk of stating =
the obvious, I like the idea of a separate list, and would like to be</div>
<div>added. But then again, i can always add myself later as well (assuming=
 the same</div><div>interface as the rest of the lists).</div><div><br></di=
v><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <br>
    <br>
    <pre cols=3D"72">--=20
Michael Halstead
Yocto Project / Sys Admin</pre>
    <br>
    <br>
    <blockquote type=3D"cite">
      Thanks again,<br>
      Ray<br>
      <blockquote type=3D"cite"> <br>
        <pre cols=3D"72">--=20
Michael Halstead
Yocto Project / Sys Admin</pre>
        <br>
        <blockquote type=3D"cite">
          <div class=3D"gmail_extra">
            <div class=3D"gmail_quote">
              <div><br>
              </div>
              <div>Cheers,</div>
              <div><br>
              </div>
              <div>Bruce</div>
              <div>=A0</div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"> <br>
                Sau!
                <div>
                  <div><br>
                    <br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> As far as a
                          meta-cloud layer is concerned, I&#39;m not sure I
                          am<br>
                          knowledgeable enough in this area to weigh in.
                          =A0I&#39;m currently<br>
                          researching a filesystem implementation for
                          OpenStack and have stumbled<br>
                          across Ceph/RBD and Gluster modules that look
                          promising. On top of this,<br>
                          XCP is documented to include support for
                          VastSky and can be integrated<br>
                          with DRBD. =A0And, the storage and hypervisor
                          are only two pieces of the<br>
                          puzzle for a cloud implementation!<br>
                          <br>
                        </blockquote>
                      </blockquote>
                      <br>
                      Cool !<br>
                      I know, the meta-&quot;cloud&quot; name is quite/too
                      ambitious, it was not meant<br>
                      to be a one week effort. But why aim low :).<br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> I think I would
                          encourage you to also include OpenStack in a<br>
                          meta-virtualization layer until it has matured
                          to the point where<br>
                          abstraction is more warranted.<br>
                        </blockquote>
                      </blockquote>
                      <br>
                      Agree.<br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> Since you&#39;ve al=
ready
                          created a presence<br>
                          at github, would it be possible to rename your
                          layer to<br>
                          meta-virtualization and absorb the entire
                          meta-xen layer? =A0I can push<br>
                          any changes for Xen/XCP here, it sounds like
                          it is a central place for<br>
                          libvirt and could also contain Bruce&#39;s kernel
                          modifications.<br>
                          <br>
                          Alternatively, I can create a
                          meta-virtualization project. =A0In any case,<br>
                          those on the To and CC list should receive
                          access to this layer as a<br>
                          starting point.<br>
                          <br>
                          Just my two cents. =A0:)<br>
                        </blockquote>
                        <br>
                        I&#39;d like to offer to host this combined layer
                        (whatever we decide to<br>
                        call it) on <a href=3D"http://git.yoctoproject.org"=
 target=3D"_blank">git.yoctoproject.org</a> if
                        that would help people and people<br>
                        are interested. My only concern is in the area
                        of maintainership, we<br>
                        need to clearly define who maintains what and
                        what the patch submission<br>
                        process is in the README.<br>
                        <br>
                      </blockquote>
                      <br>
                      Thanks,<br>
                      <br>
                      Sounds good to centralize everything, since
                      Raymond is the majority code<br>
                      contributor, perhaps he, if willing, can maintain
                      the<br>
                      meta-virtualization layer.<br>
                      If you want a co/sub-maintainer I&#39;ll be happy to
                      help out.<br>
                      <br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> Cheers,<br>
                        <br>
                        Richard<br>
                        <br>
                        <br>
                        <br>
                        _______________________________________________<br>
                        Openembedded-core mailing list<br>
                        <a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
                        <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailm=
an/listinfo/openembedded-core" target=3D"_blank">http://lists.linuxtogo.org=
/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                        <br>
                      </blockquote>
                      <br>
                      <br>
                      _______________________________________________<br>
                      Openembedded-core mailing list<br>
                      <a href=3D"mailto:Openembedded-core@lists.openembedde=
d.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
                      <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman=
/listinfo/openembedded-core" target=3D"_blank">http://lists.linuxtogo.org/c=
gi-bin/mailman/listinfo/openembedded-core</a><br>
                      <br>
                      <br>
                    </blockquote>
                    <br>
                    _______________________________________________<br>
                    Openembedded-core mailing list<br>
                    <a href=3D"mailto:Openembedded-core@lists.openembedded.=
org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
                    <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/l=
istinfo/openembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core</a><br>
                  </div>
                </div>
              </blockquote>
            </div>
            <br>
            <br clear=3D"all">
            <div><br>
            </div>
            -- <br>
            &quot;Thou shalt not follow the NULL pointer, for chaos and
            madness await thee at its end&quot;<br>
          </div>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
    <br>
  </div></div></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;<br>
</div>

--f46d04071169f5073e04cfcde077--
