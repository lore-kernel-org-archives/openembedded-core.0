Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA6946FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 03:54:39 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 38so184864qte.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 20:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vmOGR57I59rtRz+xV5LuhHdeqVlRoSiLQssNqJJB5Lo=;
	b=EPjV1mbeelr0uLLAhORlLdpa/HQ5Qw6klo4FVnZz1RndLwQKfrb/6k1oBdwpJsWpJx
	4GLqqHoLrUuI0mK/gcLbdaOWFm6ZtzUoT0SIqrT0eclLk6Tazpxe514B0o+l+HxoP/iC
	yvbuTMJOcVEoCN5BXko8MVm776VuwfxC7L65ZB9Q3OP9ta7s2YgkgYiRhg9v6p35vslO
	mMfi2opE5qiDg6J18FF+unnyWe9G3M8vjHI0WSE49qqDdUSZ218EMYaYEEIa87Coa67m
	M0FJlZman2c73jJgkfr9pul5EncRMRhl1MDXCJYqpupAKnqKwm2+gRX42173TASAKpOB
	JWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vmOGR57I59rtRz+xV5LuhHdeqVlRoSiLQssNqJJB5Lo=;
	b=gl8dFiws77lnEkw07vEzNgPraYpOCQZ6Pq7WyR/fnMomxHFSu8XjWyrcMkMI3qgtJa
	3k5ebxUMZ85R010NGrwNLgpAfw1Zo98K6En216ErmUe75Zwo/Mzf5lIWqPwgklJ/irYg
	t4VKwwwJPZxuDLdoVYjiFd0x8je5rXUUKzWErf6PMpv26KjaTy+Mi/wRknBDR01XPJkr
	StgMt4cH885j4JEyO4xqbAaP9WQzZeXBHLMmbRuM9VwWBCfLIi1rqk9Ij+8jjSvsSuyD
	ahP84t8nHHafh3I7DcahyeH4isEib97JcR0NErfg6FP58X3OyW9xlyhpTw2Fq51xAiaS
	jAOg==
X-Gm-Message-State: AE9vXwNcbmBlse6rgQTq8u05QkX7yk6RhFYzHvSdhKf7s8tlRU63A/NijmDiRCZfW47PRsIJvGFZbGHXzvOIgw==
X-Received: by 10.237.35.114 with SMTP id i47mr32995713qtc.30.1474343679911;
	Mon, 19 Sep 2016 20:54:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 20:54:39 -0700 (PDT)
In-Reply-To: <CADkTA4NA9Oze0zsUrvasfb=Rmx==iTEFpai4QXVP=1vsps8ADg@mail.gmail.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
	<CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
	<db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
	<CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com>
	<3b43b291-4f81-f801-4f23-cf5647bd37fb@intel.com>
	<6c08189b-9ac1-d239-c324-c9d04e38ed2d@windriver.com>
	<1474318190.24399.19.camel@intel.com>
	<28095475-0487-d01c-e90e-147f03091758@intel.com>
	<CADkTA4Ptre9P4MUr9D6dfxhHek8d5X3owr+q5mVWVFWWLxZKFA@mail.gmail.com>
	<9b22685c-2fae-0b02-899d-eced3e69a931@intel.com>
	<CADkTA4NA9Oze0zsUrvasfb=Rmx==iTEFpai4QXVP=1vsps8ADg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 23:54:39 -0400
Message-ID: <CADkTA4OKvqskGO_aAoh6_oF80Uo65B3S2v4zWXkm0NB-1Ry1BA@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Tue, 20 Sep 2016 03:54:40 -0000
Content-Type: multipart/alternative; boundary=001a113e32805175d9053ce863eb

--001a113e32805175d9053ce863eb
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 19, 2016 at 8:03 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Sep 19, 2016 at 7:02 PM, Cal Sullivan <
> california.l.sullivan@intel.com> wrote:
>
>>
>>
>> On 09/19/2016 03:55 PM, Bruce Ashfield wrote:
>>
>>
>>
>> On Mon, Sep 19, 2016 at 6:02 PM, Cal Sullivan <
>> california.l.sullivan@intel.com> wrote:
>>
>>> I don't have time to smoke test a SRCREV update for so many machines
>>> right now, so I think for now I will just set the correct PV in the various
>>> linux-yocto recipes so we don't block master-next builds.
>>>
>>> Is this acceptable?
>>>
>>
>> In the linux-yocto bbappends of the various layers ? I keep track of the
>> PV's in the
>> core recipes themselves, so they shouldn't need to be modified.
>>
>> You're right. Only the linux-yocto bbappends in meta-yocto-bsp need
>> MACHINE-specific PVs right now.
>> The issue with 4.1 (used by lsb right now) in oe-core is that
>> LINUX_VERSION was bumped to 4.1.32 rather than 4.1.31 in error.
>>
>
> I'll take care of that part in a few hours. Since I've been testing the
> SRCREVs, I'll double
> check and tweak it as need be.
>

Strangely I had merged 4.1.32 (the tag was present), but I didn't update
the machine
SRCREVs to match.

I was integrating 4.8-rc7 (and preempt-rt) today, so I've merged the 4.1.32
tag, and will
send it along with my series on Tuesday morning.

Bruce


>
> Bruce
>
>
>>
>> ---
>> Cal
>>
>>
>>
>> Bruce
>>
>>
>>>
>>> Thanks,
>>> Cal
>>>
>>>
>>> On 09/19/2016 01:49 PM, Saul Wold wrote:
>>>
>>>> On Mon, 2016-09-19 at 15:55 -0400, Bruce Ashfield wrote:
>>>>
>>>>> On 2016-09-19 03:53 PM, Cal Sullivan wrote:
>>>>>
>>>>>> Yep, these all have incorrect PVs.
>>>>>> 628bf62756 Merge tag 'v4.4.11' into standard/base
>>>>>> The problem seems fairly wide spread.
>>>>>>
>>>>>> Bruce, do you suggest updating PVs or updating the SRCREVs (is
>>>>>> there a
>>>>>> good reason to keep using old SRCREVs?)?
>>>>>>
>>>>> Updating the SRCREVs is the right thing to do to sync them up now.
>>>>>
>>>>> but ..
>>>>>
>>>>> at the same time, they should probably have their own PVs, since
>>>>> next time up update 4.4.x, they'll fall out of sync and fail again.
>>>>>
>>>>> +1, I think that these need their own PV since they also don't update
>>>> as fast as the base qemu recipes do.
>>>>
>>>> Sau!
>>>>
>>>> We want them to be aligned with the latest -stable, but we also
>>>>> don't need failures every time I push a new SRCREV and update the
>>>>> PV of the base recipe.
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>>> ---
>>>>>> Cal
>>>>>>
>>>>>>
>>>>>> On 09/19/2016 11:54 AM, Burton, Ross wrote:
>>>>>>
>>>>>>>
>>>>>>> On 19 September 2016 at 18:05, Cal Sullivan
>>>>>>> <california.l.sullivan@intel.com
>>>>>>> <mailto:california.l.sullivan@intel.com>> wrote:
>>>>>>>
>>>>>>>      It looks like the function is doing as its supposed to, and
>>>>>>> we
>>>>>>>      need to update some PVs or SRCREVs to match PVs.
>>>>>>>
>>>>>>>      E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.
>>>>>>>
>>>>>>>
>>>>>>> And some more builders failed with 4.4:
>>>>>>>
>>>>>>> ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
>>>>>>> do_kernel_version_sanity_check: Package Version
>>>>>>> (4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does not match of
>>>>>>> kernel
>>>>>>> being built (4.4.11). Please update the PV variable to match the
>>>>>>> kernel source.
>>>>>>> ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
>>>>>>> do_kernel_version_sanity_check: Function failed:
>>>>>>> do_kernel_version_sanity_check (log file is located at
>>>>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>>>>>>> arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-
>>>>>>> yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-
>>>>>>> r0/temp/log.do_kernel_version_sanity_check.30210)
>>>>>>> NOTE: recipe usbutils-008-r0: task do_fetch: Started
>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>>>>>>> arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-
>>>>>>> yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-
>>>>>>> r0/temp/log.do_kernel_version_sanity_check.30210
>>>>>>> ERROR: Task
>>>>>>> (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>>>>>>> arm/build/meta/recipes-kernel/linux/linux-
>>>>>>> yocto_4.4.bb:do_kernel_version_sanity_check)
>>>>>>> failed with exit code '1'
>>>>>>>
>>>>>>> (ditto for ppc and x86)
>>>>>>>
>>>>>>> Ross
>>>>>>>
>>>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e32805175d9053ce863eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 19, 2016 at 8:03 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Mon, Sep 19, 2016 at 7:02 PM, Cal Sullivan <span dir=3D"ltr=
">&lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">=
california.l.sullivan@intel.<wbr>com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span>
    <br>
    <br>
    <div>On 09/19/2016 03:55 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Mon, Sep 19, 2016 at 6:02 PM, Cal
            Sullivan <span dir=3D"ltr">&lt;<a href=3D"mailto:california.l.s=
ullivan@intel.com" target=3D"_blank">california.l.sullivan@intel.c<wbr>om</=
a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">I don&#39;t
              have time to smoke test a SRCREV update for so many
              machines right now, so I think for now I will just set the
              correct PV in the various linux-yocto recipes so we don&#39;t
              block master-next builds.<br>
              <br>
              Is this acceptable?<br>
            </blockquote>
            <div><br>
            </div>
            <div>In the linux-yocto bbappends of the various layers ? I
              keep track of the PV&#39;s in the</div>
            <div>core recipes themselves, so they shouldn&#39;t need to be
              modified.</div>
          </div>
        </div>
      </div>
    </blockquote></span>
    You&#39;re right. Only the linux-yocto bbappends in meta-yocto-bsp need
    MACHINE-specific PVs right now.<br>
    The issue with 4.1 (used by lsb right now) in oe-core is that
    LINUX_VERSION was bumped to 4.1.32 rather than 4.1.31 in error.<br></di=
v></blockquote><div><br></div></span><div>I&#39;ll take care of that part i=
n a few hours. Since I&#39;ve been testing the SRCREVs, I&#39;ll double</di=
v><div>check and tweak it as need be.</div></div></div></div></blockquote><=
div><br></div><div>Strangely I had merged 4.1.32 (the tag was present), but=
 I didn&#39;t update the machine</div><div>SRCREVs to match.=C2=A0</div><di=
v><br></div><div>I was integrating 4.8-rc7 (and preempt-rt) today, so I&#39=
;ve merged the 4.1.32 tag, and will</div><div>send it along with my series =
on Tuesday morning.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote"><span class=3D"HOEnZb"><font color=3D"#888888"><di=
v><br></div><div>Bruce</div></font></span><div><div class=3D"h5"><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#0=
00000">
    <br>
    ---<br>
    Cal<div><div><br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <br>
              Thanks,<br>
              Cal
              <div>
                <div><br>
                  <br>
                  On 09/19/2016 01:49 PM, Saul Wold wrote:<br>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On Mon, 2016-09-19 at 15:55 -0400, Bruce Ashfield
                    wrote:<br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On 2016-09-19 03:53 PM, Cal Sullivan wrote:<br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                        Yep, these all have incorrect PVs.<br>
                        628bf62756 Merge tag &#39;v4.4.11&#39; into
                        standard/base<br>
                        The problem seems fairly wide spread.<br>
                        <br>
                        Bruce, do you suggest updating PVs or updating
                        the SRCREVs (is<br>
                        there a<br>
                        good reason to keep using old SRCREVs?)?<br>
                      </blockquote>
                      Updating the SRCREVs is the right thing to do to
                      sync them up now.<br>
                      <br>
                      but ..<br>
                      <br>
                      at the same time, they should probably have their
                      own PVs, since<br>
                      next time up update 4.4.x, they&#39;ll fall out of
                      sync and fail again.<br>
                      <br>
                    </blockquote>
                    +1, I think that these need their own PV since they
                    also don&#39;t update<br>
                    as fast as the base qemu recipes do.<br>
                    <br>
                    Sau!<br>
                    <br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      We want them to be aligned with the latest
                      -stable, but we also<br>
                      don&#39;t need failures every time I push a new SRCRE=
V
                      and update the<br>
                      PV of the base recipe.<br>
                      <br>
                      Bruce<br>
                      <br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                        <br>
                        ---<br>
                        Cal<br>
                        <br>
                        <br>
                        On 09/19/2016 11:54 AM, Burton, Ross wrote:<br>
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                          <br>
                          On 19 September 2016 at 18:05, Cal Sullivan<br>
                          &lt;<a href=3D"mailto:california.l.sullivan@intel=
.com" target=3D"_blank">california.l.sullivan@intel.c<wbr>om</a><br>
                          &lt;mailto:<a href=3D"mailto:california.l.sulliva=
n@intel.com" target=3D"_blank">california.l.sullivan@<wbr>intel.com</a>&gt;=
&gt;
                          wrote:<br>
                          <br>
                          =C2=A0 =C2=A0 =C2=A0It looks like the function is=
 doing as
                          its supposed to, and<br>
                          we<br>
                          =C2=A0 =C2=A0 =C2=A0need to update some PVs or SR=
CREVs to
                          match PVs.<br>
                          <br>
                          =C2=A0 =C2=A0 =C2=A0E.g., on the error below, SRC=
REV
                          d6237b3b24 is indeed 4.1.31.<br>
                          <br>
                          <br>
                          And some more builders failed with 4.4:<br>
                          <br>
                          ERROR: linux-yocto-4.4.20+gitAUTOINC+<wbr>e66032e=
2d9_628bf62756-r0<br>
                          do_kernel_version_sanity_check<wbr>: Package
                          Version<br>
                          (4.4.20+gitAUTOINC+e66032e2d9_<wbr>628bf62756)
                          does not match of<br>
                          kernel<br>
                          being built (4.4.11). Please update the PV
                          variable to match the<br>
                          kernel source.<br>
                          ERROR: linux-yocto-4.4.20+gitAUTOINC+<wbr>e66032e=
2d9_628bf62756-r0<br>
                          do_kernel_version_sanity_check<wbr>: Function
                          failed:<br>
                          do_kernel_version_sanity_check (log file is
                          located at<br>
                          /home/pokybuild/yocto-autobuil<wbr>der/yocto-work=
er/nightly-<br>
                          arm/build/build/tmp/work/beagl<wbr>ebone-poky-lin=
ux-gnueabi/linux<wbr>-<br>
                          yocto/4.4.20+gitAUTOINC+e66032<wbr>e2d9_628bf6275=
6-<br>
                          r0/temp/log.do_kernel_version_<wbr>sanity_check.3=
0210)<br>
                          NOTE: recipe usbutils-008-r0: task do_fetch:
                          Started<br>
                          ERROR: Logfile of failure stored in:<br>
                          /home/pokybuild/yocto-autobuil<wbr>der/yocto-work=
er/nightly-<br>
                          arm/build/build/tmp/work/beagl<wbr>ebone-poky-lin=
ux-gnueabi/linux<wbr>-<br>
                          yocto/4.4.20+gitAUTOINC+e66032<wbr>e2d9_628bf6275=
6-<br>
                          r0/temp/log.do_kernel_version_<wbr>sanity_check.3=
0210<br>
                          ERROR: Task<br>
                          (/home/pokybuild/yocto-autobui<wbr>lder/yocto-wor=
ker/nightly-<br>
                          arm/build/meta/recipes-kernel/<wbr>linux/linux-<b=
r>
                          yocto_4.4.bb:do_kernel_version<wbr>_sanity_check)=
<br>
                          failed with exit code &#39;1&#39;<br>
                          <br>
                          (ditto for ppc and x86)<br>
                          <br>
                          Ross<br>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                  <br>
                  -- <br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div data-smartmail=3D"gmail_signature">&quot;Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end&quot;</div>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div></div></div><div><div class=3D"h5"><br><br clear=3D"all"=
><div><br></div>-- <br><div data-smartmail=3D"gmail_signature">&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;</div>
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113e32805175d9053ce863eb--
