Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1TeXFj-0006az-La
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 21:32:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 47A28138077;
	Fri, 30 Nov 2012 13:17:45 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xP8TruwSWpjW; Fri, 30 Nov 2012 13:17:38 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 10FA1138091;
	Fri, 30 Nov 2012 13:17:35 -0700 (MST)
Message-ID: <50B9145E.9080005@se-eng.com>
Date: Fri, 30 Nov 2012 13:17:34 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Michael Halstead <michael@yoctoproject.org>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org>
In-Reply-To: <50B8F4FE.1070003@yoctoproject.org>
Cc: oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ray.danks@se-eng.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 20:32:04 -0000
Content-Type: multipart/alternative;
	boundary="------------000104010504030504050407"

--------------000104010504030504050407
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11/30/2012 11:03 AM, Michael Halstead wrote:
> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>
>>
>>
>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com=20
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>     On 11/30/2012 03:29 AM, David Nystr=F6m wrote:
>>
>>         On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>
>>             On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks wrote:
>>
>>                 Thanks for looping me in here David. The initial goal
>>                 for the meta-xen
>>                 layer was in fact to encompass Xen Cloud Platform.
>>                  As such, the intent
>>                 was to contain both hypervisor and user-space
>>                 applications.  Indeed, the
>>                 xen distribution itself includes xm/libxl; hypervisor
>>                 abstraction would
>>                 be somewhat tedious in my opinion.
>>
>>                 The layer just received commits for expanding the
>>                 libvirt build to
>>                 support qemu.  The commonalities and shared packaged
>>                 between xen, qemu,
>>                 and kvm implementations are such that I would also
>>                 agree that meta-xen
>>                 should be expanded/renamed to encompass all
>>                 virtualization types; I also
>>                 support the move to meta-virtualization.
>>
>>
>>         meta-virtualization sounds good, let co-op on this so we
>>         don't duplicate
>>         work.
>>
>>     If everyone is OK with this, I will have Michael Halstead create
>>     a repo, please send him your keys so that you will have write
>>     access to it.
>>
>>
>> This works for me. If Michael already has our keys, do we need to=20
>> resend or can
>> a local copy happen ?
> I already have keys for,
>
> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>
> Either of you can currently add=20
> git@git.yoctoproject.org:meta-virtualization as a git remote and start=20
> the repository. Once we have initial code and the maintainers and=20
> patch submission guidelines in the readme I can publicly list the new=20
> repository.
>
> I require an ssh public key for Raymond Danks.
Thanks Michael.  I got your response and was able to push meta-xen to=20
the newly created repository on meta-virtualization.  I added one commit=20
to tweak the README and conf/layer.conf for the new name.
>
>
> We also need a short description for the listing on=20
> git.yoctoproject.org. I could be something similar to, but better=20
> than, "Layer enabling virtualization support. "
How about "Layer enabling hypervisor, virtualization tool stack, and=20
cloud support."

Also - I referenced the mail alias meta-virtualization at yoctoproject=20
in the README.  When you publish this, can we use something like that as=20
well?

Thanks again,
Ray
>
> --=20
> Michael Halstead
> Yocto Project / Sys Admin
>
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>     Sau!
>>
>>
>>                 As far as a meta-cloud layer is concerned, I'm not
>>                 sure I am
>>                 knowledgeable enough in this area to weigh in.  I'm
>>                 currently
>>                 researching a filesystem implementation for OpenStack
>>                 and have stumbled
>>                 across Ceph/RBD and Gluster modules that look
>>                 promising. On top of this,
>>                 XCP is documented to include support for VastSky and
>>                 can be integrated
>>                 with DRBD.  And, the storage and hypervisor are only
>>                 two pieces of the
>>                 puzzle for a cloud implementation!
>>
>>
>>         Cool !
>>         I know, the meta-"cloud" name is quite/too ambitious, it was
>>         not meant
>>         to be a one week effort. But why aim low :).
>>
>>                 I think I would encourage you to also include
>>                 OpenStack in a
>>                 meta-virtualization layer until it has matured to the
>>                 point where
>>                 abstraction is more warranted.
>>
>>
>>         Agree.
>>
>>                 Since you've already created a presence
>>                 at github, would it be possible to rename your layer t=
o
>>                 meta-virtualization and absorb the entire meta-xen
>>                 layer?  I can push
>>                 any changes for Xen/XCP here, it sounds like it is a
>>                 central place for
>>                 libvirt and could also contain Bruce's kernel
>>                 modifications.
>>
>>                 Alternatively, I can create a meta-virtualization
>>                 project.  In any case,
>>                 those on the To and CC list should receive access to
>>                 this layer as a
>>                 starting point.
>>
>>                 Just my two cents.  :)
>>
>>
>>             I'd like to offer to host this combined layer (whatever
>>             we decide to
>>             call it) on git.yoctoproject.org
>>             <http://git.yoctoproject.org> if that would help people
>>             and people
>>             are interested. My only concern is in the area of
>>             maintainership, we
>>             need to clearly define who maintains what and what the
>>             patch submission
>>             process is in the README.
>>
>>
>>         Thanks,
>>
>>         Sounds good to centralize everything, since Raymond is the
>>         majority code
>>         contributor, perhaps he, if willing, can maintain the
>>         meta-virtualization layer.
>>         If you want a co/sub-maintainer I'll be happy to help out.
>>
>>
>>             Cheers,
>>
>>             Richard
>>
>>
>>
>>             _______________________________________________
>>             Openembedded-core mailing list
>>             Openembedded-core@lists.openembedded.org
>>             <mailto:Openembedded-core@lists.openembedded.org>
>>             http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openem=
bedded-core
>>
>>
>>
>>         _______________________________________________
>>         Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-core
>>
>>
>>
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore
>>
>>
>>
>>
>> --=20
>> "Thou shalt not follow the NULL pointer, for chaos and madness await=20
>> thee at its end"
>


--------------000104010504030504050407
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 11/30/2012 11:03 AM, Michael
      Halstead wrote:<br>
    </div>
    <blockquote cite="mid:50B8F4FE.1070003@yoctoproject.org" type="cite">
      <meta content="text/html; charset=ISO-8859-1"
        http-equiv="Content-Type">
      <div class="moz-cite-prefix">On 11/30/2012 09:26 AM, Bruce
        Ashfield wrote:<br>
      </div>
      <blockquote
cite="mid:CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com"
        type="cite"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Fri, Nov 30, 2012 at 12:15 PM,
            Saul Wold <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:sgw@linux.intel.com" target="_blank">sgw@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="im">On 11/30/2012 03:29 AM, David Nystr&ouml;m
                wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex"> On
                  11/29/2012 02:54 PM, Richard Purdie wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks
                    wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      Thanks for looping me in here David. The initial
                      goal for the meta-xen<br>
                      layer was in fact to encompass Xen Cloud Platform.
                      &nbsp;As such, the intent<br>
                      was to contain both hypervisor and user-space
                      applications. &nbsp;Indeed, the<br>
                      xen distribution itself includes xm/libxl;
                      hypervisor abstraction would<br>
                      be somewhat tedious in my opinion.<br>
                      <br>
                      The layer just received commits for expanding the
                      libvirt build to<br>
                      support qemu. &nbsp;The commonalities and shared
                      packaged between xen, qemu,<br>
                      and kvm implementations are such that I would also
                      agree that meta-xen<br>
                      should be expanded/renamed to encompass all
                      virtualization types; I also<br>
                      support the move to meta-virtualization.<br>
                      <br>
                    </blockquote>
                  </blockquote>
                  <br>
                  meta-virtualization sounds good, let co-op on this so
                  we don't duplicate<br>
                  work.<br>
                  <br>
                </blockquote>
              </div>
              If everyone is OK with this, I will have Michael Halstead
              create a repo, please send him your keys so that you will
              have write access to it.<br>
            </blockquote>
            <div><br>
            </div>
            <div>This works for me. If Michael already has our keys, do
              we need to resend or can</div>
            <div>a local copy happen ?</div>
          </div>
        </div>
      </blockquote>
      I already have keys for,<br>
      <br>
      David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50<br>
      Bruce Ashfield&nbsp; 4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02<br>
      <br>
      Either of you can currently add <a moz-do-not-send="true"
        class="moz-txt-link-abbreviated"
        href="mailto:git@git.yoctoproject.org:meta-virtualization">git@git.yoctoproject.org:meta-virtualization</a>
      as a git remote and start the repository. Once we have initial
      code and the maintainers and patch submission guidelines in the
      readme I can publicly list the new repository.<br>
      <br>
      I require an ssh public key for Raymond Danks.<br>
    </blockquote>
    Thanks Michael.&nbsp; I got your response and was able to push meta-xen
    to the newly created repository on meta-virtualization.&nbsp; I added one
    commit to tweak the README and conf/layer.conf for the new name.<br>
    <blockquote cite="mid:50B8F4FE.1070003@yoctoproject.org" type="cite">
      <br>
      <br>
      We also need a short description for the listing on
      git.yoctoproject.org. I could be something similar to, but better
      than, "Layer enabling virtualization support. "<br>
    </blockquote>
    How about "Layer enabling hypervisor, virtualization tool stack, and
    cloud support."<br>
    <br>
    Also - I referenced the mail alias meta-virtualization at
    yoctoproject in the README.&nbsp; When you publish this, can we use
    something like that as well?<br>
    <br>
    Thanks again,<br>
    Ray<br>
    <blockquote cite="mid:50B8F4FE.1070003@yoctoproject.org" type="cite">
      <br>
      <pre class="moz-signature" cols="72">-- 
Michael Halstead
Yocto Project / Sys Admin</pre>
      <br>
      <blockquote
cite="mid:CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com"
        type="cite">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Cheers,</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
              Sau!
              <div class="HOEnZb">
                <div class="h5"><br>
                  <br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> As far as a meta-cloud
                        layer is concerned, I'm not sure I am<br>
                        knowledgeable enough in this area to weigh in.
                        &nbsp;I'm currently<br>
                        researching a filesystem implementation for
                        OpenStack and have stumbled<br>
                        across Ceph/RBD and Gluster modules that look
                        promising. On top of this,<br>
                        XCP is documented to include support for VastSky
                        and can be integrated<br>
                        with DRBD. &nbsp;And, the storage and hypervisor are
                        only two pieces of the<br>
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
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> I think I would
                        encourage you to also include OpenStack in a<br>
                        meta-virtualization layer until it has matured
                        to the point where<br>
                        abstraction is more warranted.<br>
                      </blockquote>
                    </blockquote>
                    <br>
                    Agree.<br>
                    <br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> Since you've already
                        created a presence<br>
                        at github, would it be possible to rename your
                        layer to<br>
                        meta-virtualization and absorb the entire
                        meta-xen layer? &nbsp;I can push<br>
                        any changes for Xen/XCP here, it sounds like it
                        is a central place for<br>
                        libvirt and could also contain Bruce's kernel
                        modifications.<br>
                        <br>
                        Alternatively, I can create a
                        meta-virtualization project. &nbsp;In any case,<br>
                        those on the To and CC list should receive
                        access to this layer as a<br>
                        starting point.<br>
                        <br>
                        Just my two cents. &nbsp;:)<br>
                      </blockquote>
                      <br>
                      I'd like to offer to host this combined layer
                      (whatever we decide to<br>
                      call it) on <a moz-do-not-send="true"
                        href="http://git.yoctoproject.org"
                        target="_blank">git.yoctoproject.org</a> if that
                      would help people and people<br>
                      are interested. My only concern is in the area of
                      maintainership, we<br>
                      need to clearly define who maintains what and what
                      the patch submission<br>
                      process is in the README.<br>
                      <br>
                    </blockquote>
                    <br>
                    Thanks,<br>
                    <br>
                    Sounds good to centralize everything, since Raymond
                    is the majority code<br>
                    contributor, perhaps he, if willing, can maintain
                    the<br>
                    meta-virtualization layer.<br>
                    If you want a co/sub-maintainer I'll be happy to
                    help out.<br>
                    <br>
                    <br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      Cheers,<br>
                      <br>
                      Richard<br>
                      <br>
                      <br>
                      <br>
                      _______________________________________________<br>
                      Openembedded-core mailing list<br>
                      <a moz-do-not-send="true"
                        href="mailto:Openembedded-core@lists.openembedded.org"
                        target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                      <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                        target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                      <br>
                    </blockquote>
                    <br>
                    <br>
                    _______________________________________________<br>
                    Openembedded-core mailing list<br>
                    <a moz-do-not-send="true"
                      href="mailto:Openembedded-core@lists.openembedded.org"
                      target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                    <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                      target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                    <br>
                    <br>
                  </blockquote>
                  <br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                  <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                    target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          "Thou shalt not follow the NULL pointer, for chaos and madness
          await thee at its end"<br>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------000104010504030504050407--
