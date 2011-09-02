Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QzW01-00021t-7w
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 17:49:45 +0200
Received: by fxg11 with SMTP id 11so1911155fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2011 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Dhk8GC/RvQl/jLUivFrFGydg+drjK9pafe9BmKVu7/I=;
	b=UevoiLftvUDC/Zt9ZXRIykUE6JygmNp5aKKVOi7brF69zV9TyxgOOcAgNH7K3f0389
	MmQo5WzVdU3WhFiM7Yh1fUPNjyPFRadssr9GT+Q7iBCFv6C9zihXwwwmReWtblFBk6jw
	oIZIvr6EIMBZ1eYoXJ4QbbCxdtygbsQ2nYSdQ=
MIME-Version: 1.0
Received: by 10.223.61.12 with SMTP id r12mr1966145fah.46.1314978285356; Fri,
	02 Sep 2011 08:44:45 -0700 (PDT)
Received: by 10.152.22.231 with HTTP; Fri, 2 Sep 2011 08:44:45 -0700 (PDT)
In-Reply-To: <8954E4C1-E43C-46BE-91AB-6DAFF38D2A4A@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
	<CA+T6QPk=XR4M0cVoYn=EdckJxDKifooGv8+_yw+0AXTUQ85pWg@mail.gmail.com>
	<8954E4C1-E43C-46BE-91AB-6DAFF38D2A4A@dominion.thruhere.net>
Date: Fri, 2 Sep 2011 10:44:45 -0500
Message-ID: <CAD=GYpbnRqSfDDz3VBGkjC5jHPj_c20nfvtadv0CTQqquCywzA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 02 Sep 2011 15:49:45 -0000
Content-Type: multipart/alternative; boundary=0015173ff0a896061204abf73da9

--0015173ff0a896061204abf73da9
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 30, 2011 at 12:47 PM, Koen Kooi <koen@dominion.thruhere.net>
wrote:
>
> Op 30 aug. 2011, om 18:46 heeft Jason Kridner het volgende geschreven:
>
>> On Mon, Aug 29, 2011 at 7:08 PM, Joel A Fernandes <agnel.joel@gmail.com>
wrote:
>>> On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner <jkridner@beagleboard.org>
wrote:
>>>>>>>
>>>>>>> This script is BSP specific and shouldn't live in the OE-core layer.
>>>>>>
>>>>>> The only issue is this script is used from within the IMAGE_CMD_sdimg
>>>>>> code which lives in OE-core (meta/classes/image_types.
>>>>>
>>>>> classes shouldn't be calling external scripts
>>>>>
>>>>
>>>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>>>> such that it can be used generically to produce SD card images,
>>>> instead of trying to move this to meta-ti?  Should it perhaps be a bit
>>>> closer to what is being done by the Linaro image tools [1]?
>>>>
>>>> [1] https://wiki.linaro.org/Source/ImageBuilding
>>>>
>>>
>>> Don't the Linaro scripts need to run on the target?
>>
>> No.
>>
>>> Does it fit well
>>> with OE(-core) ?
>>
>> I don't know, but I hoped that others would comment to help figure it
>> out.  I think it is a common challenge not just for ARM architectures.
>> I'm not sure if the approach is general enough or not, but it does go
>> beyond the BeagleBoard.
>>
>> My primary concerns about leaving it in the BSP are:
>> 1) that there is some room for non-BeagleBoard specific optimizations
>> to the card layout and
>> 2) there may be improvements to the tools that make it easier to
>> create images for systems with different boot requirements.
>>
>> Also, I think we might want to move to an ext3 partition only in the
>> future or other such layout optimizations.  I'd like that to be
>> something that can be parameterized by the BSP.
>
> I think you're missing the point:
>
> The *script* needs to go into the BSP, you are free to extend the
bbclasses with code to deal with sd cards internally in OE-core.
>
>

Hi Koen,

Can you suggest how we proceed with extending the bbclass?

I have tried both .bbappend and BBCLASSEXTEND and didn't get it to work.

I could create a new class and inherit the oe-core one from it with tweaks.

Here is complete IRC discussion between me and bluelightning on the
reasoning to extend the image.bbclass:

* cminyard (~cminyard@pool-173-57-155-71.dllstx.fios.verizon.net) has joined
#oe
<joelagnel> I'd like to extend a bbclass in oe-core with tweaks in another
layer
<joelagnel> What is the right way to do so? .bbappend ? BBCLASSEXTEND?
<GNUtoo|work> JaMa|Wrk, btw I've also another patch:
<GNUtoo|work> at eukrea we use ubifs, and had the exact same issue than the
freerunner ubifs issue, at least it seems
<GNUtoo|work> we fixed it
<GNUtoo|work> so if the patch arrived, it should fix it for you too
<GNUtoo|work> joelagnel, BBCLASSEXTEND seem for recipes
<joelagnel> I've seen it for classes in meta-oe:
<joelagnel> ../meta-openembedded/meta-oe/classes/gnome.bbclass:BBCLASSEXTEND
+= "native"
<joelagnel> GNUtoo|work, but it doesn't do what I want
<joelagnel> I can create a new class, inherit from the oe-core one and put
my code there, but I think that'll get rejected ;)
<GNUtoo|work> ok
<GNUtoo|work> maybe ask in the list
<joelagnel> everyone here on long weekend holiday? ;)
* hollisb (~hollisb@c-24-20-193-174.hsd1.or.comcast.net) has joined #oe
<bluelightning> joelagnel: I don't think bbclassextend is what you want
<bluelightning> what tweaks do you want to apply?
<joelagnel> bluelightning, can I name a class in an upper layer with the
same filename as that of a lower layer, and still be able to inherit the
lower layer one?
<bluelightning> I don't think you can do it that way no
<bluelightning> if it's the same name it will just replace it effectively
<bluelightning> the most likely result in that case is you'll get a circular
reference
<joelagnel> BlindMan, there was some talk about moving my changes
(IMAGE_CMD_sdimg) to the bsp layer
<joelagnel>
https://github.com/joelagnel/oe-core/blob/db4c960da57e8e0ae4741eea703a4e163c589efa/meta/classes/image_types.bbclass
<joelagnel> sorry I meant bluelightning ;)
<joelagnel> need coffee!!! :-D
<joelagnel> and need .bbclassappend ;)
* msm (~msm@192.88.168.35) has joined #oe
<bluelightning> hmm; this is an interesting one
<bluelightning> I recall the discussion on the mailing list... I do wonder
whether we ought to try to find a way to get this into oe-core itself
* phdeswer has quit (Ping timeout: 276 seconds)
<joelagnel> bluelightning, I'm copying in a ubi file into the rootfs which I
don't think is generic enough
<joelagnel> also all sorts of assumptions are made about bootloader file
names (U-boot, uEnv, user.txt) etc
<bluelightning> hmm
<bluelightning> is this only likely to be applicable to one machine then?
<joelagnel> bluelightning, yeah. specially the bootloader environment files
etc make assumptions about the machine (i2c bus names etc)
<joelagnel> bluelightning, also Richard was suggesting that this was
attempted before but requires special mounts etc which is true
<joelagnel> we need it in there though so we could move it to the bsp for
now
<joelagnel> sounds good?
* Hoolxi (~Openfree@124.78.96.197) has joined #oe
<bluelightning> joelagnel: well as a temporary measure but really
duplicating class files is worth avoiding
<bluelightning> just because of the pain of keeping it up-to-date
<joelagnel> sure
<bluelightning> I have to admit I'm unsure of the correct solution in this
case though
<bluelightning> it's worth trying to coax people on the mailing list to come
up with the right answer :)
<joelagnel> bluelightning, sure will do ,thanks :)


Thanks,
Joel

--0015173ff0a896061204abf73da9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<font class=3D"Apple-style-span" face=3D"verdana, sans-serif"><br><br>On Tu=
e, Aug 30, 2011 at 12:47 PM, Koen Kooi &lt;<a href=3D"mailto:koen@dominion.=
thruhere.net">koen@dominion.thruhere.net</a>&gt; wrote:<br>&gt;<br>&gt; Op =
30 aug. 2011, om 18:46 heeft Jason Kridner het volgende geschreven:<br>
&gt;<br>&gt;&gt; On Mon, Aug 29, 2011 at 7:08 PM, Joel A Fernandes &lt;<a h=
ref=3D"mailto:agnel.joel@gmail.com">agnel.joel@gmail.com</a>&gt; wrote:<br>=
&gt;&gt;&gt; On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner &lt;<a href=3D"=
mailto:jkridner@beagleboard.org">jkridner@beagleboard.org</a>&gt; wrote:<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; This script is=
 BSP specific and shouldn&#39;t live in the OE-core layer.<br>&gt;&gt;&gt;&=
gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;&gt; The only issue is this script is us=
ed from within the IMAGE_CMD_sdimg<br>
&gt;&gt;&gt;&gt;&gt;&gt; code which lives in OE-core (meta/classes/image_ty=
pes.<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; classes shouldn&#39;t =
be calling external scripts<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Is the right approach to add parameters to the IMAGE_CMD_s=
dimg class<br>&gt;&gt;&gt;&gt; such that it can be used generically to prod=
uce SD card images,<br>&gt;&gt;&gt;&gt; instead of trying to move this to m=
eta-ti? =A0Should it perhaps be a bit<br>
&gt;&gt;&gt;&gt; closer to what is being done by the Linaro image tools [1]=
?<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; [1] <a href=3D"https://wiki.linar=
o.org/Source/ImageBuilding">https://wiki.linaro.org/Source/ImageBuilding</a=
><br>
&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Don&#39;t the Linaro scrip=
ts need to run on the target?<br>&gt;&gt;<br>&gt;&gt; No.<br>&gt;&gt;<br>&g=
t;&gt;&gt; Does it fit well<br>&gt;&gt;&gt; with OE(-core) ?<br>&gt;&gt;<br=
>
&gt;&gt; I don&#39;t know, but I hoped that others would comment to help fi=
gure it<br>&gt;&gt; out. =A0I think it is a common challenge not just for A=
RM architectures.<br>&gt;&gt; I&#39;m not sure if the approach is general e=
nough or not, but it does go<br>
&gt;&gt; beyond the BeagleBoard.<br>&gt;&gt;<br>&gt;&gt; My primary concern=
s about leaving it in the BSP are:<br>&gt;&gt; 1) that there is some room f=
or non-BeagleBoard specific optimizations<br>&gt;&gt; to the card layout an=
d<br>
&gt;&gt; 2) there may be improvements to the tools that make it easier to<b=
r>&gt;&gt; create images for systems with different boot requirements.<br>&=
gt;&gt;<br>&gt;&gt; Also, I think we might want to move to an ext3 partitio=
n only in the<br>
&gt;&gt; future or other such layout optimizations. =A0I&#39;d like that to=
 be<br>&gt;&gt; something that can be parameterized by the BSP.<br>&gt;<br>=
&gt; I think you&#39;re missing the point:<br>&gt;<br>&gt; The *script* nee=
ds to go into the BSP, you are free to extend the bbclasses with code to de=
al with sd cards internally in OE-core.<br>
&gt;<br>&gt;<br><br>Hi Koen,<br><br>Can you suggest how we proceed with ext=
ending the bbclass?<br><br>I have tried both .bbappend and BBCLASSEXTEND an=
d didn&#39;t get it to work.<br><br>I could create a new class and inherit =
the oe-core one from it with tweaks.</font><div>
<font class=3D"Apple-style-span" face=3D"verdana, sans-serif"><br></font></=
div><div><font class=3D"Apple-style-span" face=3D"verdana, sans-serif">Here=
 is complete IRC discussion between me and bluelightning on the reasoning t=
o extend the image.bbclass:<br>
<br>* cminyard (~<a href=3D"mailto:cminyard@pool-173-57-155-71.dllstx.fios.=
verizon.net">cminyard@pool-173-57-155-71.dllstx.fios.verizon.net</a>) has j=
oined #oe<br>&lt;joelagnel&gt; I&#39;d like to extend a bbclass in oe-core =
with tweaks in another layer<br>
&lt;joelagnel&gt; What is the right way to do so? .bbappend ? BBCLASSEXTEND=
?<br>&lt;GNUtoo|work&gt; JaMa|Wrk, btw I&#39;ve also another patch:<br>&lt;=
GNUtoo|work&gt; at eukrea we use ubifs, and had the exact same issue than t=
he freerunner ubifs issue, at least it seems<br>
&lt;GNUtoo|work&gt; we fixed it<br>&lt;GNUtoo|work&gt; so if the patch arri=
ved, it should fix it for you too<br>&lt;GNUtoo|work&gt; joelagnel, BBCLASS=
EXTEND seem for recipes<br>&lt;joelagnel&gt; I&#39;ve seen it for classes i=
n meta-oe:<br>
&lt;joelagnel&gt; ../meta-openembedded/meta-oe/classes/gnome.bbclass:BBCLAS=
SEXTEND +=3D &quot;native&quot;<br>&lt;joelagnel&gt; GNUtoo|work, but it do=
esn&#39;t do what I want<br>&lt;joelagnel&gt; I can create a new class, inh=
erit from the oe-core one and put my code there, but I think that&#39;ll ge=
t rejected ;)<br>
&lt;GNUtoo|work&gt; ok<br>&lt;GNUtoo|work&gt; maybe ask in the list<br>&lt;=
joelagnel&gt; everyone here on long weekend holiday? ;)<br>* hollisb (~<a h=
ref=3D"mailto:hollisb@c-24-20-193-174.hsd1.or.comcast.net">hollisb@c-24-20-=
193-174.hsd1.or.comcast.net</a>) has joined #oe<br>
&lt;bluelightning&gt; joelagnel: I don&#39;t think bbclassextend is what yo=
u want<br>&lt;bluelightning&gt; what tweaks do you want to apply?<br>&lt;jo=
elagnel&gt; bluelightning, can I name a class in an upper layer with the sa=
me filename as that of a lower layer, and still be able to inherit the lowe=
r layer one?<br>
&lt;bluelightning&gt; I don&#39;t think you can do it that way no<br>&lt;bl=
uelightning&gt; if it&#39;s the same name it will just replace it effective=
ly<br>&lt;bluelightning&gt; the most likely result in that case is you&#39;=
ll get a circular reference<br>
&lt;joelagnel&gt; BlindMan, there was some talk about moving my changes (IM=
AGE_CMD_sdimg) to the bsp layer<br>&lt;joelagnel&gt; <a href=3D"https://git=
hub.com/joelagnel/oe-core/blob/db4c960da57e8e0ae4741eea703a4e163c589efa/met=
a/classes/image_types.bbclass">https://github.com/joelagnel/oe-core/blob/db=
4c960da57e8e0ae4741eea703a4e163c589efa/meta/classes/image_types.bbclass</a>=
<br>
&lt;joelagnel&gt; sorry I meant bluelightning ;)<br>&lt;joelagnel&gt; need =
coffee!!! :-D<br>&lt;joelagnel&gt; and need .bbclassappend ;)<br>* msm (~<a=
 href=3D"mailto:msm@192.88.168.35">msm@192.88.168.35</a>) has joined #oe<br=
>
&lt;bluelightning&gt; hmm; this is an interesting one<br>&lt;bluelightning&=
gt; I recall the discussion on the mailing list... I do wonder whether we o=
ught to try to find a way to get this into oe-core itself<br>* phdeswer has=
 quit (Ping timeout: 276 seconds)<br>
&lt;joelagnel&gt; bluelightning, I&#39;m copying in a ubi file into the roo=
tfs which I don&#39;t think is generic enough<br>&lt;joelagnel&gt; also all=
 sorts of assumptions are made about bootloader file names (U-boot, uEnv, u=
ser.txt) etc<br>
&lt;bluelightning&gt; hmm<br>&lt;bluelightning&gt; is this only likely to b=
e applicable to one machine then?<br>&lt;joelagnel&gt; bluelightning, yeah.=
 specially the bootloader environment files etc make assumptions about the =
machine (i2c bus names etc)<br>
&lt;joelagnel&gt; bluelightning, also Richard was suggesting that this was =
attempted before but requires special mounts etc which is true<br>&lt;joela=
gnel&gt; we need it in there though so we could move it to the bsp for now<=
br>
&lt;joelagnel&gt; sounds good?<br>* Hoolxi (~<a href=3D"mailto:Openfree@124=
.78.96.197">Openfree@124.78.96.197</a>) has joined #oe<br>&lt;bluelightning=
&gt; joelagnel: well as a temporary measure but really duplicating class fi=
les is worth avoiding<br>
&lt;bluelightning&gt; just because of the pain of keeping it up-to-date<br>=
&lt;joelagnel&gt; sure<br>&lt;bluelightning&gt; I have to admit I&#39;m uns=
ure of the correct solution in this case though<br>&lt;bluelightning&gt; it=
&#39;s worth trying to coax people on the mailing list to come up with the =
right answer :)<br>
&lt;joelagnel&gt; bluelightning, sure will do ,thanks :)</font><br></div><d=
iv><font class=3D"Apple-style-span" face=3D"verdana, sans-serif"><br></font=
></div><div><font class=3D"Apple-style-span" face=3D"verdana, sans-serif"><=
br></font></div>
<div><font class=3D"Apple-style-span" face=3D"verdana, sans-serif">Thanks,<=
/font></div><div><font class=3D"Apple-style-span" face=3D"verdana, sans-ser=
if">Joel</font></div>

--0015173ff0a896061204abf73da9--
