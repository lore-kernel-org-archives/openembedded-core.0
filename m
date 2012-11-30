Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mhalstead@linuxfoundation.org>) id 1Tea9k-0003I9-Qc
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 00:38:05 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so686239pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 15:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:x-gm-message-state;
	bh=e7jVkfDAF2Cnuo/NJS6/lym3pLsUK21O85w8Dl8Dwg8=;
	b=eZqlEmwQAyXlYeMNNI5DMNFLR9syW8CcL9uDFiEBnXv0tzZqeYUB4mSqziAL7k9LYW
	mr12C7Xzs9ZiIz569JEWkMpNvHWunwPpIWPXxwFJDmV8/680DD4XnBiGNXghBxTBpbih
	ahn5rH4szFafczZPyzaVSKxeH/Ix6lWH7uHA96AFqiz2NSPK+cRuKfjGo/p5YiC9cTBW
	4BfhBDCTW8HHAmA3Ev+664PaTfMz6zdR/aDQZ27LRCCxlZW03FmPN2E252ADAUGLjs4W
	FRpZTkM7Yan6iLN+XydnkwDYHVzyNPlWZ73J53KQxZsa2UQfDCZVvxGVnZqO/E2yqdPk
	3CbA==
Received: by 10.68.237.135 with SMTP id vc7mr9873131pbc.2.1354317826155;
	Fri, 30 Nov 2012 15:23:46 -0800 (PST)
Received: from pride.localdomain (patmando.opb.org. [204.27.190.53])
	by mx.google.com with ESMTPS id nf9sm3726345pbc.17.2012.11.30.15.23.43
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 15:23:44 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <50B93FFB.9050505@yoctoproject.org>
Date: Fri, 30 Nov 2012 15:23:39 -0800
From: Michael Halstead <michael@yoctoproject.org>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: ray.danks@se-eng.com
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
In-Reply-To: <50B9145E.9080005@se-eng.com>
X-Enigmail-Version: 1.4.6
X-Gm-Message-State: ALoCoQkfK6e74tFl6622sbaAYIOJVZCysKovssqLSUgciag/sUMk1PaIceVrIGIR8nY43BsaRROI
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
X-List-Received-Date: Fri, 30 Nov 2012 23:38:05 -0000
X-Groupsio-MsgNum: 32047
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms090101030106000306010708"

--------------ms090101030106000306010708
Content-Type: multipart/alternative;
 boundary="------------060902050502010207010003"

--------------060902050502010207010003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/30/2012 12:17 PM, Raymond Danks wrote:
> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>>
>>>
>>>
>>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com
>>> <mailto:sgw@linux.intel.com>> wrote:
>>>
>>>     On 11/30/2012 03:29 AM, David Nystr=F6m wrote:
>>>
>>>         On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>
>>>             On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>>
>>>                 Thanks for looping me in here David. The initial
>>>                 goal for the meta-xen
>>>                 layer was in fact to encompass Xen Cloud Platform.
>>>                  As such, the intent
>>>                 was to contain both hypervisor and user-space
>>>                 applications.  Indeed, the
>>>                 xen distribution itself includes xm/libxl;
>>>                 hypervisor abstraction would
>>>                 be somewhat tedious in my opinion.
>>>
>>>                 The layer just received commits for expanding the
>>>                 libvirt build to
>>>                 support qemu.  The commonalities and shared packaged
>>>                 between xen, qemu,
>>>                 and kvm implementations are such that I would also
>>>                 agree that meta-xen
>>>                 should be expanded/renamed to encompass all
>>>                 virtualization types; I also
>>>                 support the move to meta-virtualization.
>>>
>>>
>>>         meta-virtualization sounds good, let co-op on this so we
>>>         don't duplicate
>>>         work.
>>>
>>>     If everyone is OK with this, I will have Michael Halstead create
>>>     a repo, please send him your keys so that you will have write
>>>     access to it.
>>>
>>>
>>> This works for me. If Michael already has our keys, do we need to
>>> resend or can
>>> a local copy happen ?
>> I already have keys for,
>>
>> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
>> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>>
>> Either of you can currently add
>> git@git.yoctoproject.org:meta-virtualization as a git remote and
>> start the repository. Once we have initial code and the maintainers
>> and patch submission guidelines in the readme I can publicly list the
>> new repository.
>>
>> I require an ssh public key for Raymond Danks.
> Thanks Michael.  I got your response and was able to push meta-xen to
> the newly created repository on meta-virtualization.  I added one
> commit to tweak the README and conf/layer.conf for the new name.
>>
>>
>> We also need a short description for the listing on
>> git.yoctoproject.org. I could be something similar to, but better
>> than, "Layer enabling virtualization support. "
> How about "Layer enabling hypervisor, virtualization tool stack, and
> cloud support."
>
Sounds good to me. Thank you.
> Also - I referenced the mail alias meta-virtualization at yoctoproject
> in the README.  When you publish this, can we use something like that
> as well?
>
I can add a private list for meta-virtualization@yoctoproject.org. Who
shall I add to membership?


--=20
Michael Halstead
Yocto Project / Sys Admin



> Thanks again,
> Ray
>>
>> --=20
>> Michael Halstead
>> Yocto Project / Sys Admin
>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>> =20
>>>
>>>
>>>     Sau!
>>>
>>>
>>>                 As far as a meta-cloud layer is concerned, I'm not
>>>                 sure I am
>>>                 knowledgeable enough in this area to weigh in.  I'm
>>>                 currently
>>>                 researching a filesystem implementation for
>>>                 OpenStack and have stumbled
>>>                 across Ceph/RBD and Gluster modules that look
>>>                 promising. On top of this,
>>>                 XCP is documented to include support for VastSky and
>>>                 can be integrated
>>>                 with DRBD.  And, the storage and hypervisor are only
>>>                 two pieces of the
>>>                 puzzle for a cloud implementation!
>>>
>>>
>>>         Cool !
>>>         I know, the meta-"cloud" name is quite/too ambitious, it was
>>>         not meant
>>>         to be a one week effort. But why aim low :).
>>>
>>>                 I think I would encourage you to also include
>>>                 OpenStack in a
>>>                 meta-virtualization layer until it has matured to
>>>                 the point where
>>>                 abstraction is more warranted.
>>>
>>>
>>>         Agree.
>>>
>>>                 Since you've already created a presence
>>>                 at github, would it be possible to rename your layer =
to
>>>                 meta-virtualization and absorb the entire meta-xen
>>>                 layer?  I can push
>>>                 any changes for Xen/XCP here, it sounds like it is a
>>>                 central place for
>>>                 libvirt and could also contain Bruce's kernel
>>>                 modifications.
>>>
>>>                 Alternatively, I can create a meta-virtualization
>>>                 project.  In any case,
>>>                 those on the To and CC list should receive access to
>>>                 this layer as a
>>>                 starting point.
>>>
>>>                 Just my two cents.  :)
>>>
>>>
>>>             I'd like to offer to host this combined layer (whatever
>>>             we decide to
>>>             call it) on git.yoctoproject.org
>>>             <http://git.yoctoproject.org> if that would help people
>>>             and people
>>>             are interested. My only concern is in the area of
>>>             maintainership, we
>>>             need to clearly define who maintains what and what the
>>>             patch submission
>>>             process is in the README.
>>>
>>>
>>>         Thanks,
>>>
>>>         Sounds good to centralize everything, since Raymond is the
>>>         majority code
>>>         contributor, perhaps he, if willing, can maintain the
>>>         meta-virtualization layer.
>>>         If you want a co/sub-maintainer I'll be happy to help out.
>>>
>>>
>>>             Cheers,
>>>
>>>             Richard
>>>
>>>
>>>
>>>             _______________________________________________
>>>             Openembedded-core mailing list
>>>             Openembedded-core@lists.openembedded.org
>>>             <mailto:Openembedded-core@lists.openembedded.org>
>>>             http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core
>>>
>>>
>>>
>>>         _______________________________________________
>>>         Openembedded-core mailing list
>>>         Openembedded-core@lists.openembedded.org
>>>         <mailto:Openembedded-core@lists.openembedded.org>
>>>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core
>>>
>>>
>>>
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core
>>>
>>>
>>>
>>>
>>> --=20
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>
>



--------------060902050502010207010003
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DISO-8859-1"
      http-equiv=3D"Content-Type">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">On 11/30/2012 12:17 PM, Raymond Danks
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:50B9145E.9080005@se-eng.com" type=3D"cite">
      <meta content=3D"text/html; charset=3DISO-8859-1"
        http-equiv=3D"Content-Type">
      <div class=3D"moz-cite-prefix">On 11/30/2012 11:03 AM, Michael
        Halstead wrote:<br>
      </div>
      <blockquote cite=3D"mid:50B8F4FE.1070003@yoctoproject.org"
        type=3D"cite">
        <meta content=3D"text/html; charset=3DISO-8859-1"
          http-equiv=3D"Content-Type">
        <div class=3D"moz-cite-prefix">On 11/30/2012 09:26 AM, Bruce
          Ashfield wrote:<br>
        </div>
        <blockquote
cite=3D"mid:CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT=3D=3DQ5mHg@mail.=
gmail.com"
          type=3D"cite"><br>
          <div class=3D"gmail_extra"><br>
            <br>
            <div class=3D"gmail_quote">On Fri, Nov 30, 2012 at 12:15 PM,
              Saul Wold <span dir=3D"ltr">&lt;<a moz-do-not-send=3D"true"=

                  href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">s=
gw@linux.intel.com</a>&gt;</span>
              wrote:<br>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div class=3D"im">On 11/30/2012 03:29 AM, David Nystr&oum=
l;m
                  wrote:<br>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=

                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On 11/29/2012 02:54 PM, Richard Purdie wrote:<br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks
                      wrote:<br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> Thanks for looping me
                        in here David. The initial goal for the meta-xen<=
br>
                        layer was in fact to encompass Xen Cloud
                        Platform. &nbsp;As such, the intent<br>
                        was to contain both hypervisor and user-space
                        applications. &nbsp;Indeed, the<br>
                        xen distribution itself includes xm/libxl;
                        hypervisor abstraction would<br>
                        be somewhat tedious in my opinion.<br>
                        <br>
                        The layer just received commits for expanding
                        the libvirt build to<br>
                        support qemu. &nbsp;The commonalities and shared
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
                    so we don't duplicate<br>
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
        David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50<br>=

        Bruce Ashfield&nbsp; 4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60=
:02<br>
        <br>
        Either of you can currently add <a moz-do-not-send=3D"true"
          class=3D"moz-txt-link-abbreviated"
          href=3D"mailto:git@git.yoctoproject.org:meta-virtualization">gi=
t@git.yoctoproject.org:meta-virtualization</a>
        as a git remote and start the repository. Once we have initial
        code and the maintainers and patch submission guidelines in the
        readme I can publicly list the new repository.<br>
        <br>
        I require an ssh public key for Raymond Danks.<br>
      </blockquote>
      Thanks Michael.&nbsp; I got your response and was able to push meta=
-xen
      to the newly created repository on meta-virtualization.&nbsp; I add=
ed
      one commit to tweak the README and conf/layer.conf for the new
      name.<br>
      <blockquote cite=3D"mid:50B8F4FE.1070003@yoctoproject.org"
        type=3D"cite"> <br>
        <br>
        We also need a short description for the listing on
        git.yoctoproject.org. I could be something similar to, but
        better than, "Layer enabling virtualization support. "<br>
      </blockquote>
      How about "Layer enabling hypervisor, virtualization tool stack,
      and cloud support."<br>
      <br>
    </blockquote>
    Sounds good to me. Thank you.<br>
    <blockquote cite=3D"mid:50B9145E.9080005@se-eng.com" type=3D"cite"> A=
lso
      - I referenced the mail alias meta-virtualization at yoctoproject
      in the README.&nbsp; When you publish this, can we use something li=
ke
      that as well?<br>
      <br>
    </blockquote>
    I can add a private list for <a class=3D"moz-txt-link-abbreviated" hr=
ef=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yo=
ctoproject.org</a>.
    Who shall I add to membership?<br>
    <br>
    <br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Michael Halstead
Yocto Project / Sys Admin</pre>
    <br>
    <br>
    <blockquote cite=3D"mid:50B9145E.9080005@se-eng.com" type=3D"cite">
      Thanks again,<br>
      Ray<br>
      <blockquote cite=3D"mid:50B8F4FE.1070003@yoctoproject.org"
        type=3D"cite"> <br>
        <pre class=3D"moz-signature" cols=3D"72">--=20
Michael Halstead
Yocto Project / Sys Admin</pre>
        <br>
        <blockquote
cite=3D"mid:CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT=3D=3DQ5mHg@mail.=
gmail.com"
          type=3D"cite">
          <div class=3D"gmail_extra">
            <div class=3D"gmail_quote">
              <div><br>
              </div>
              <div>Cheers,</div>
              <div><br>
              </div>
              <div>Bruce</div>
              <div>&nbsp;</div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
                Sau!
                <div class=3D"HOEnZb">
                  <div class=3D"h5"><br>
                    <br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <blockquote class=3D"gmail_quote" style=3D"margin=
:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex"> As far as a
                          meta-cloud layer is concerned, I'm not sure I
                          am<br>
                          knowledgeable enough in this area to weigh in.
                          &nbsp;I'm currently<br>
                          researching a filesystem implementation for
                          OpenStack and have stumbled<br>
                          across Ceph/RBD and Gluster modules that look
                          promising. On top of this,<br>
                          XCP is documented to include support for
                          VastSky and can be integrated<br>
                          with DRBD. &nbsp;And, the storage and hyperviso=
r
                          are only two pieces of the<br>
                          puzzle for a cloud implementation!<br>
                          <br>
                        </blockquote>
                      </blockquote>
                      <br>
                      Cool !<br>
                      I know, the meta-"cloud" name is quite/too
                      ambitious, it was not meant<br>
                      to be a one week effort. But why aim low :).<br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <blockquote class=3D"gmail_quote" style=3D"margin=
:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex"> I think I would
                          encourage you to also include OpenStack in a<br=
>
                          meta-virtualization layer until it has matured
                          to the point where<br>
                          abstraction is more warranted.<br>
                        </blockquote>
                      </blockquote>
                      <br>
                      Agree.<br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <blockquote class=3D"gmail_quote" style=3D"margin=
:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex"> Since you've already
                          created a presence<br>
                          at github, would it be possible to rename your
                          layer to<br>
                          meta-virtualization and absorb the entire
                          meta-xen layer? &nbsp;I can push<br>
                          any changes for Xen/XCP here, it sounds like
                          it is a central place for<br>
                          libvirt and could also contain Bruce's kernel
                          modifications.<br>
                          <br>
                          Alternatively, I can create a
                          meta-virtualization project. &nbsp;In any case,=
<br>
                          those on the To and CC list should receive
                          access to this layer as a<br>
                          starting point.<br>
                          <br>
                          Just my two cents. &nbsp;:)<br>
                        </blockquote>
                        <br>
                        I'd like to offer to host this combined layer
                        (whatever we decide to<br>
                        call it) on <a moz-do-not-send=3D"true"
                          href=3D"http://git.yoctoproject.org"
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
                      If you want a co/sub-maintainer I'll be happy to
                      help out.<br>
                      <br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> Cheers,<br>
                        <br>
                        Richard<br>
                        <br>
                        <br>
                        <br>
                        _______________________________________________<b=
r>
                        Openembedded-core mailing list<br>
                        <a moz-do-not-send=3D"true"
                          href=3D"mailto:Openembedded-core@lists.openembe=
dded.org"
                          target=3D"_blank">Openembedded-core@lists.opene=
mbedded.org</a><br>
                        <a moz-do-not-send=3D"true"
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core"
                          target=3D"_blank">http://lists.linuxtogo.org/cg=
i-bin/mailman/listinfo/openembedded-core</a><br>
                        <br>
                      </blockquote>
                      <br>
                      <br>
                      _______________________________________________<br>=

                      Openembedded-core mailing list<br>
                      <a moz-do-not-send=3D"true"
                        href=3D"mailto:Openembedded-core@lists.openembedd=
ed.org"
                        target=3D"_blank">Openembedded-core@lists.openemb=
edded.org</a><br>
                      <a moz-do-not-send=3D"true"
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core"
                        target=3D"_blank">http://lists.linuxtogo.org/cgi-=
bin/mailman/listinfo/openembedded-core</a><br>
                      <br>
                      <br>
                    </blockquote>
                    <br>
                    _______________________________________________<br>
                    Openembedded-core mailing list<br>
                    <a moz-do-not-send=3D"true"
                      href=3D"mailto:Openembedded-core@lists.openembedded=
=2Eorg"
                      target=3D"_blank">Openembedded-core@lists.openembed=
ded.org</a><br>
                    <a moz-do-not-send=3D"true"
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core"
                      target=3D"_blank">http://lists.linuxtogo.org/cgi-bi=
n/mailman/listinfo/openembedded-core</a><br>
                  </div>
                </div>
              </blockquote>
            </div>
            <br>
            <br clear=3D"all">
            <div><br>
            </div>
            -- <br>
            "Thou shalt not follow the NULL pointer, for chaos and
            madness await thee at its end"<br>
          </div>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
    <br>
  </body>
</html>

--------------060902050502010207010003--

--------------ms090101030106000306010708
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIINjDCCBjQw
ggQcoAMCAQICASAwDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDI1NVoX
DTE3MTAyNDIxMDI1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMsohUWcASz7GfKrpTOMKqANy9BV7V0igWdGxA8IU77L3aTxErQ+
fcxtDYZ36Z6GH0YFn7fq5RADteP0AYzrCA+EQTfi8q1+kA3m0nwtwXG94M5sIqsvs7lRP1aycBke
/s5g9hJHryZ2acScnzczjBCAo7X1v5G3yw8MDP2m2RCye0KfgZ4nODerZJVzhAlOD9YejvAXZqHk
sw56HzElVIoYSZ3q4+RJuPXXfIoyby+Y2m1E+YzX5iCZXBx05gk6MKAW1vaw4/v2OOLy6FZH3XHH
tOkzUreG//CsFnB9+uaYSlR65cdGzTsmoIK8WH1ygoXhRBm98SD7Hf/r3FELNvUCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBSuVYNv7DHKufcd
+q9rMfPIHeOsuzAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBADqpJw3I07QW
ke9plNBpxUxcffc7nUrIQpJHDci91DFG7fVhHRkMZ1J+BKg5UNUxIFJ2Z9B90Micc/NXcs7kPBRd
n6XGO/vPc87Y6R+cWS9Nc9+fp3Enmsm94OxOwI9wn8qnr/6o3mD4noP9JphwUPTXwHovjavRnhUQ
HLfo/i2NG0XXgTHXS2Xm0kVUozXqpYpAdumMiB/vezj1QHQJDmUdPYMcp+reg9901zkyT3fDW/iv
JVv6pWtkh6Pw2ytZT7mvg7YhX3V50Nv860cV11mocUVcqBLv0gcT+HBDYtbuvexNftwNQKD5193A
7zN4vG7CTYkXxytSjKuXrpEatEiFPxWgb84nVj25SU5q/r1Xhwby6mLhkbaXslkVtwEWT3Van49r
KjlK4XrUKYYWtnfzq6aSak5u0Vpxd1rY79tWhD3EdCvOhNz/QplNa+VkIsrcp7+8ZhP1l1b2U6Ma
xIVteuVMD3X0vziIwr7jxYae9FZjbxlpUemqXjcC0QaFfN7qI0JsQMALL7iGRBg7K0CoOBzECdD3
fuZil5kU/LP9cr1BK31U0Uy651bFnAMMMkqhAChIbn0ei72VnbpSsrrSdF0BAGYQ8vyHae5aCg+H
75dVCV33K6FuxZrf09yTz+Vx/PkdRUYkXmZz/OTfyJXsUOUXrym6KvI2rYpccSk5MIIHUDCCBjig
AwIBAgICIgMwDQYJKoZIhvcNAQEFBQAwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENv
bSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYD
VQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTAeFw0x
MjA2MTMwNDU5MjlaFw0xNDA2MTQxNjE4MzBaMIGRMRkwFwYDVQQNExBnMDFwWTYwMWJGM1BrRTY3
MQswCQYDVQQGEwJVUzEPMA0GA1UECBMGT3JlZ29uMRIwEAYDVQQHEwlIaWxsc2Jvcm8xGTAXBgNV
BAMTEE1pY2hhZWwgSGFsc3RlYWQxJzAlBgkqhkiG9w0BCQEWGG1pY2hhZWxAeW9jdG9wcm9qZWN0
Lm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMFZ+GW0VKdiyuQy3hlOvwcHxcm0
8ZwNGGah4zipYky5wVFZO7p9LjJfyF6rvd24xdkaTluxTMmd9pfq2cOVQ6c3RsPufv1yBUbytk6F
4Wk+qD0qEGjuHh5FfakcLIEsHiSn3nzaQZHaolS/yzx/A3coQS8pQrshZYqAF/ME5OxMyL8KDdtk
xatt1reDPqzvI5rKYdeEbmHsTYgd9WWHvs8MfZFHidZoAXMXU+PcsKCUxEYhgP/h9NKcTApu/Mhd
IPKn11pD+gfDM+ochGu1uxuW/t1tNJyRYDVQSDV+rpliQ7mrimSmyktIKkow02pUk4Xw3OqdYq7/
/HpVOUs5nk8CAwEAAaOCA7MwggOvMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdJQQWMBQG
CCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUcZFNotb1OfDmPE6GQ6MQIBh7meUwHwYDVR0j
BBgwFoAUrlWDb+wxyrn3HfqvazHzyB3jrLswIwYDVR0RBBwwGoEYbWljaGFlbEB5b2N0b3Byb2pl
Y3Qub3JnMIICIQYDVR0gBIICGDCCAhQwggIQBgsrBgEEAYG1NwECAjCCAf8wLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0YXJ0
Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdhcyBp
c3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAyIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRzIG9m
IHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRlZCBw
dXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMuMIGc
BggrBgEFBQcCAjCBjzAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgECGmRM
aWFiaWxpdHkgYW5kIHdhcnJhbnRpZXMgYXJlIGxpbWl0ZWQhIFNlZSBzZWN0aW9uICJMZWdhbCBh
bmQgTGltaXRhdGlvbnMiIG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3kuMDYGA1UdHwQvMC0wK6Ap
oCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUyLWNybC5jcmwwgY4GCCsGAQUFBwEBBIGB
MH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9zdWIvY2xhc3MyL2NsaWVu
dC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20vY2VydHMvc3ViLmNsYXNz
Mi5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3RhcnRzc2wuY29tLzANBgkq
hkiG9w0BAQUFAAOCAQEANR/d6M8GHL/rkx3Kz9ILDxYMcekmFgefaDXNQMicUHiUw5TsIl5af1pS
Y2AvbKlA2/FZnyG8w42FuK6ZQBZJxs4/N10NW8qDmuuFTi6TyJgurj73tx9RogW50miDHMZLoMRe
avB1h8zy99L2lRPZSebpSFkrQdYDHaGRVhYMjEcWNW9cLxhR8BaAEw/KlpERv3hUQpwGMppYOE66
M7KJ3HpeR7DXfa4njL9W2hukTQNsskdWtzejHp5iQ65+5Mv+NXLmYP4uLJcR9AbttgNhwStc0P1b
LxnQkElGeUzATOBq+QsVZ7Fo6sSS7kqrhpfaPibqpj83m/wSgpKVsbZJ3DGCA9owggPWAgEBMIGT
MIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJl
IERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMiBQ
cmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAiIDMAkGBSsOAwIaBQCgggIbMBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMTEzMDIzMjMzOVowIwYJKoZIhvcN
AQkEMRYEFL1HLu/mhyFWfNiq5hNME29zYZirMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgaQGCSsGAQQBgjcQBDGBljCBkzCBjDELMAkGA1UEBhMC
SUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRp
ZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDIgUHJpbWFyeSBJbnRlcm1l
ZGlhdGUgQ2xpZW50IENBAgIiAzCBpgYLKoZIhvcNAQkQAgsxgZaggZMwgYwxCzAJBgNVBAYTAklM
MRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZp
Y2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRp
YXRlIENsaWVudCBDQQICIgMwDQYJKoZIhvcNAQEBBQAEggEAWMLKdQD/jqyY5VLwzaaycWCApnWX
8eEJq6P9E9tEF0lEtRZlWxdFIah/qpkQLP3BqjTOTKzEgpgqnuTGoXkzCrtPJdfKNlU2y3XPFzrF
6CXIEybAJUyT5wp0hSZ1OMosoSObfFzxtw8N96h+1tpBZo5ctECl3kZ4vk/VOf9vuPmT3fsWW0Us
L6ZZMh/6loRgyyk1D7alWTguEcCzqYyXtCF+NH9+X3BGdkAuXwcDvo1nksH+VFaMmjcg+WUJHVOy
TSGDPSThro5wzZzIMJyd81Av3Hv1kQryTdlM7XV6qxdsqDV4dNlAWq6TdIHCsjU2Ra4a1eVQ7OH3
stzVWjUYsQAAAAAAAA==

--------------ms090101030106000306010708--
