Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QzWFP-0002bR-Cy
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 18:05:39 +0200
Received: by wwe32 with SMTP id 32so2511149wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2011 09:00:42 -0700 (PDT)
Received: by 10.216.137.147 with SMTP id y19mr1118362wei.112.1314979242366;
	Fri, 02 Sep 2011 09:00:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l13sm2126772wbp.20.2011.09.02.09.00.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Sep 2011 09:00:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpbnRqSfDDz3VBGkjC5jHPj_c20nfvtadv0CTQqquCywzA@mail.gmail.com>
Date: Fri, 2 Sep 2011 18:00:39 +0200
Message-Id: <9F6CB379-9DC1-4484-90F4-ED6FFF85A50F@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
	<CA+T6QPk=XR4M0cVoYn=EdckJxDKifooGv8+_yw+0AXTUQ85pWg@mail.gmail.com>
	<8954E4C1-E43C-46BE-91AB-6DAFF38D2A4A@dominion.thruhere.net>
	<CAD=GYpbnRqSfDDz3VBGkjC5jHPj_c20nfvtadv0CTQqquCywzA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: "Kridner, Jason" <jdk@ti.com>
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
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
X-List-Received-Date: Fri, 02 Sep 2011 16:05:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Why not start with

echo "inherit image" >> mynewclass.bbclass

And have the image inherit mynewclass?

Op 2 sep. 2011, om 17:44 heeft Joel A Fernandes het volgende geschreven:

>=20
>=20
> On Tue, Aug 30, 2011 at 12:47 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
> >
> > Op 30 aug. 2011, om 18:46 heeft Jason Kridner het volgende =
geschreven:
> >
> >> On Mon, Aug 29, 2011 at 7:08 PM, Joel A Fernandes =
<agnel.joel@gmail.com> wrote:
> >>> On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner =
<jkridner@beagleboard.org> wrote:
> >>>>>>>
> >>>>>>> This script is BSP specific and shouldn't live in the OE-core =
layer.
> >>>>>>
> >>>>>> The only issue is this script is used from within the =
IMAGE_CMD_sdimg
> >>>>>> code which lives in OE-core (meta/classes/image_types.
> >>>>>
> >>>>> classes shouldn't be calling external scripts
> >>>>>
> >>>>
> >>>> Is the right approach to add parameters to the IMAGE_CMD_sdimg =
class
> >>>> such that it can be used generically to produce SD card images,
> >>>> instead of trying to move this to meta-ti?  Should it perhaps be =
a bit
> >>>> closer to what is being done by the Linaro image tools [1]?
> >>>>
> >>>> [1] https://wiki.linaro.org/Source/ImageBuilding
> >>>>
> >>>
> >>> Don't the Linaro scripts need to run on the target?
> >>
> >> No.
> >>
> >>> Does it fit well
> >>> with OE(-core) ?
> >>
> >> I don't know, but I hoped that others would comment to help figure =
it
> >> out.  I think it is a common challenge not just for ARM =
architectures.
> >> I'm not sure if the approach is general enough or not, but it does =
go
> >> beyond the BeagleBoard.
> >>
> >> My primary concerns about leaving it in the BSP are:
> >> 1) that there is some room for non-BeagleBoard specific =
optimizations
> >> to the card layout and
> >> 2) there may be improvements to the tools that make it easier to
> >> create images for systems with different boot requirements.
> >>
> >> Also, I think we might want to move to an ext3 partition only in =
the
> >> future or other such layout optimizations.  I'd like that to be
> >> something that can be parameterized by the BSP.
> >
> > I think you're missing the point:
> >
> > The *script* needs to go into the BSP, you are free to extend the =
bbclasses with code to deal with sd cards internally in OE-core.
> >
> >
>=20
> Hi Koen,
>=20
> Can you suggest how we proceed with extending the bbclass?
>=20
> I have tried both .bbappend and BBCLASSEXTEND and didn't get it to =
work.
>=20
> I could create a new class and inherit the oe-core one from it with =
tweaks.
>=20
> Here is complete IRC discussion between me and bluelightning on the =
reasoning to extend the image.bbclass:
>=20
> * cminyard (~cminyard@pool-173-57-155-71.dllstx.fios.verizon.net) has =
joined #oe
> <joelagnel> I'd like to extend a bbclass in oe-core with tweaks in =
another layer
> <joelagnel> What is the right way to do so? .bbappend ? BBCLASSEXTEND?
> <GNUtoo|work> JaMa|Wrk, btw I've also another patch:
> <GNUtoo|work> at eukrea we use ubifs, and had the exact same issue =
than the freerunner ubifs issue, at least it seems
> <GNUtoo|work> we fixed it
> <GNUtoo|work> so if the patch arrived, it should fix it for you too
> <GNUtoo|work> joelagnel, BBCLASSEXTEND seem for recipes
> <joelagnel> I've seen it for classes in meta-oe:
> <joelagnel> =
../meta-openembedded/meta-oe/classes/gnome.bbclass:BBCLASSEXTEND +=3D =
"native"
> <joelagnel> GNUtoo|work, but it doesn't do what I want
> <joelagnel> I can create a new class, inherit from the oe-core one and =
put my code there, but I think that'll get rejected ;)
> <GNUtoo|work> ok
> <GNUtoo|work> maybe ask in the list
> <joelagnel> everyone here on long weekend holiday? ;)
> * hollisb (~hollisb@c-24-20-193-174.hsd1.or.comcast.net) has joined =
#oe
> <bluelightning> joelagnel: I don't think bbclassextend is what you =
want
> <bluelightning> what tweaks do you want to apply?
> <joelagnel> bluelightning, can I name a class in an upper layer with =
the same filename as that of a lower layer, and still be able to inherit =
the lower layer one?
> <bluelightning> I don't think you can do it that way no
> <bluelightning> if it's the same name it will just replace it =
effectively
> <bluelightning> the most likely result in that case is you'll get a =
circular reference
> <joelagnel> BlindMan, there was some talk about moving my changes =
(IMAGE_CMD_sdimg) to the bsp layer
> <joelagnel> =
https://github.com/joelagnel/oe-core/blob/db4c960da57e8e0ae4741eea703a4e16=
3c589efa/meta/classes/image_types.bbclass
> <joelagnel> sorry I meant bluelightning ;)
> <joelagnel> need coffee!!! :-D
> <joelagnel> and need .bbclassappend ;)
> * msm (~msm@192.88.168.35) has joined #oe
> <bluelightning> hmm; this is an interesting one
> <bluelightning> I recall the discussion on the mailing list... I do =
wonder whether we ought to try to find a way to get this into oe-core =
itself
> * phdeswer has quit (Ping timeout: 276 seconds)
> <joelagnel> bluelightning, I'm copying in a ubi file into the rootfs =
which I don't think is generic enough
> <joelagnel> also all sorts of assumptions are made about bootloader =
file names (U-boot, uEnv, user.txt) etc
> <bluelightning> hmm
> <bluelightning> is this only likely to be applicable to one machine =
then?
> <joelagnel> bluelightning, yeah. specially the bootloader environment =
files etc make assumptions about the machine (i2c bus names etc)
> <joelagnel> bluelightning, also Richard was suggesting that this was =
attempted before but requires special mounts etc which is true
> <joelagnel> we need it in there though so we could move it to the bsp =
for now
> <joelagnel> sounds good?
> * Hoolxi (~Openfree@124.78.96.197) has joined #oe
> <bluelightning> joelagnel: well as a temporary measure but really =
duplicating class files is worth avoiding
> <bluelightning> just because of the pain of keeping it up-to-date
> <joelagnel> sure
> <bluelightning> I have to admit I'm unsure of the correct solution in =
this case though
> <bluelightning> it's worth trying to coax people on the mailing list =
to come up with the right answer :)
> <joelagnel> bluelightning, sure will do ,thanks :)
>=20
>=20
> Thanks,
> Joel
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



