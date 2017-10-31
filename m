Return-Path: <artur@madrzak.eu>
Received: from s20.linuxpl.com (s20.linuxpl.com [78.46.68.78])
	by mail.openembedded.org (Postfix) with ESMTP id 66CA978210
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 15:18:45 +0000 (UTC)
Received: from d11138.artnet.gda.pl ([5.133.11.138]:56521 helo=[10.10.40.5])
	by s20.linuxpl.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.88)
	(envelope-from <artur@madrzak.eu>)
	id 1e9YJR-0002oW-Pc; Tue, 31 Oct 2017 16:18:45 +0100
Date: Tue, 31 Oct 2017 16:18:43 +0100
In-Reply-To: <CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
References: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
	<20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
	<CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,ed.bartosh@linux.intel.com
From: Artur Madrzak <artur@madrzak.eu>
Message-ID: <E353D5C3-ABB9-4858-B29C-4E9157F98AF3@madrzak.eu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Tue, 31 Oct 2017 15:18:46 -0000
Content-Type: multipart/alternative;
	boundary="----3VTK7FFH35H7DM2AKLAITCSKFWLS2U"
Content-Transfer-Encoding: 7bit

------3VTK7FFH35H7DM2AKLAITCSKFWLS2U
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

The patchwork is complaining because by mistake I sent patch for Morty bra=
nch as master one=2E I have some issues with sending patches to the group b=
y git send-email but I'll send formatted patch soon=2E=20

Dnia 31 pa=C5=BAdziernika 2017 16:08:58 CET, Nicolas Dechesne <nicolas=2Ed=
echesne@linaro=2Eorg> napisa=C5=82(a):
>On Tue, Oct 31, 2017 at 2:33 PM, Ed Bartosh
><ed=2Ebartosh@linux=2Eintel=2Ecom> wrote:
>>
>> On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur M=C4=85drzak wrote:
>> > The WIC's 'part' can now give a name for GPT partition in WKS file=2E
>> > It's similar to '--label', but is naming partitions instead file
>systems=2E
>> > It's required by some bootloaders to partitions have specified
>names=2E
>> >
>>
>> Thank you for the patch!
>>
>> +1
>
>Yes, +1 from me as well=2E The context of this patch is for the Qualcomm
>SoC based board that have *interesting* bootloaders requirements, one
>of them being to look for partition by their names=2E
>
>Patchwork complained about the patch, so Artur, please address these
>comments and resend the patch=2E
>
>Ed: do you think this can be backported to previous release branches?
>The lack of --part-name on previous releases make WIC unusable for us=2E
>The backport is not trivial since many changes have happened, but
>Artur has a equivalent patch for morty at least=2E
>
>
>>
>>
>> > Signed-off-by: Artur M=C4=85drzak <artur@madrzak=2Eeu>
>> > ---
>> >  scripts/lib/wic/help=2Epy                  |  2 ++
>> >  scripts/lib/wic/ksparser=2Epy              |  1 +
>> >  scripts/lib/wic/partition=2Epy             |  1 +
>> >  scripts/lib/wic/plugins/imager/direct=2Epy | 11 +++++++++++
>> >  4 files changed, 15 insertions(+)
>> >
>> > diff --git a/scripts/lib/wic/help=2Epy b/scripts/lib/wic/help=2Epy
>> > index bd9c62e2e8=2E=2E2ac45e052e 100644
>> > --- a/scripts/lib/wic/help=2Epy
>> > +++ b/scripts/lib/wic/help=2Epy
>> > @@ -970,6 +970,8 @@ DESCRIPTION
>> >                              This option cannot be used with
>--fixed-size
>> >                              option=2E
>> >
>> > +         --part-name: This option is specific to wic=2E It specifies
>name for
>> > GPT partitions=2E
>> > +
>> >           --part-type: This option is specific to wic=2E It specifies
>> > partition
>> >                        type GUID for GPT partitions=2E
>> >                        List of partition type GUIDS can be found
>here:
>> > diff --git a/scripts/lib/wic/ksparser=2Epy
>b/scripts/lib/wic/ksparser=2Epy
>> > index 99b66eebc5=2E=2E7850e81d2f 100644
>> > --- a/scripts/lib/wic/ksparser=2Epy
>> > +++ b/scripts/lib/wic/ksparser=2Epy
>> > @@ -144,6 +144,7 @@ class KickStart():
>> >          part=2Eadd_argument('--no-table', action=3D'store_true')
>> >          part=2Eadd_argument('--ondisk', '--ondrive', dest=3D'disk',
>> > default=3D'sda')
>> >          part=2Eadd_argument("--overhead-factor", type=3Doverheadtype=
)
>> > +        part=2Eadd_argument('--part-name')
>> >          part=2Eadd_argument('--part-type')
>> >          part=2Eadd_argument('--rootfs-dir')
>> >
>> > diff --git a/scripts/lib/wic/partition=2Epy
>b/scripts/lib/wic/partition=2Epy
>> > index b623bb9e6d=2E=2E66e61ba70c 100644
>> > --- a/scripts/lib/wic/partition=2Epy
>> > +++ b/scripts/lib/wic/partition=2Epy
>> > @@ -51,6 +51,7 @@ class Partition():
>> >          self=2Eno_table =3D args=2Eno_table
>> >          self=2Enum =3D None
>> >          self=2Eoverhead_factor =3D args=2Eoverhead_factor
>> > +        self=2Epart_name =3D args=2Epart_name
>> >          self=2Epart_type =3D args=2Epart_type
>> >          self=2Erootfs_dir =3D args=2Erootfs_dir
>> >          self=2Esize =3D args=2Esize
>> > diff --git a/scripts/lib/wic/plugins/imager/direct=2Epy
>> > b/scripts/lib/wic/plugins/imager/direct=2Epy
>> > index 60317eed22=2E=2Ebdb8385620 100644
>> > --- a/scripts/lib/wic/plugins/imager/direct=2Epy
>> > +++ b/scripts/lib/wic/plugins/imager/direct=2Epy
>> > @@ -366,6 +366,10 @@ class PartitionedImage():
>> >          for num in range(len(self=2Epartitions)):
>> >              part =3D self=2Epartitions[num]
>> >
>> > +            if self=2Eptable_format =3D=3D 'msdos' and part=2Epart_n=
ame:
>> > +                raise WicError("setting custom partition name is
>not " \
>> > +                               "implemented for msdos partitions")
>> > +
>> >              if self=2Eptable_format =3D=3D 'msdos' and part=2Epart_t=
ype:
>> >                  # The --part-type can also be implemented for MBR
>> > partitions,
>> >                  # in which case it would map to the 1-byte
>"partition type"
>> > @@ -519,6 +523,13 @@ class PartitionedImage():
>> >              self=2E_create_partition(self=2Epath, part=2Etype,
>> >                                     parted_fs_type, part=2Estart,
>> > part=2Esize_sec)
>> >
>> > +            if part=2Epart_name:
>> > +                logger=2Edebug("partition %d: set name to %s",
>> > +                             part=2Enum, part=2Epart_name)
>> > +                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" %
>\
>> > +                                         (part=2Enum,
>part=2Epart_name,
>> > +                                          self=2Epath),
>self=2Enative_sysroot)
>> > +
>> >              if part=2Epart_type:
>> >                  logger=2Edebug("partition %d: set type UID to %s",
>> >                               part=2Enum, part=2Epart_type)
>> > --
>> > 2=2E13=2E6
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists=2Eopenembedded=2Eorg
>> > http://lists=2Eopenembedded=2Eorg/mailman/listinfo/openembedded-core
>>
>> --
>> --
>> Regards,
>> Ed
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists=2Eopenembedded=2Eorg
>> http://lists=2Eopenembedded=2Eorg/mailman/listinfo/openembedded-core

-- Wys=C5=82ane za pomoc=C4=85 K-9 Mail=2E

------3VTK7FFH35H7DM2AKLAITCSKFWLS2U
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Hi,<br>
<br>
The patchwork is complaining because by mistake I sent patch for Morty bra=
nch as master one=2E I have some issues with sending patches to the group b=
y git send-email but I&#39;ll send formatted patch soon=2E <br><br><div cla=
ss=3D"gmail_quote">Dnia 31 pa=C5=BAdziernika 2017 16:08:58 CET, Nicolas Dec=
hesne &lt;nicolas=2Edechesne@linaro=2Eorg&gt; napisa=C5=82(a):<blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">On Tue, Oct 31, 2017 at 2:33 PM, Ed Bartosh &lt;ed=
=2Ebartosh@linux=2Eintel=2Ecom&gt; wrote:<br /><blockquote class=3D"gmail_q=
uote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf;=
 padding-left: 1ex;"><br /> On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur=
 M=C4=85drzak wrote:<br /><blockquote class=3D"gmail_quote" style=3D"margin=
: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #ad7fa8; padding-left: 1ex;">=
 The WIC's 'part' can now give a name for GPT partition in WKS file=2E<br /=
> It's similar to '--label', but is naming partitions instead file systems=
=2E<br /> It's required by some bootloaders to partitions have specified na=
mes=2E</blockquote><br /><br /> Thank you for the patch!<br /><br /> +1<br =
/></blockquote><br />Yes, +1 from me as well=2E The context of this patch i=
s for the Qualcomm<br />SoC based board that have *interesting* bootloaders=
 requirements, one<br />of them being to look for partition by their names=
=2E<br /><br />Patchwork complained about the patch, so Artur, please addre=
ss these<br />comments and resend the patch=2E<br /><br />Ed: do you think =
this can be backported to previous release branches?<br />The lack of --par=
t-name on previous releases make WIC unusable for us=2E<br />The backport i=
s not trivial since many changes have happened, but<br />Artur has a equiva=
lent patch for morty at least=2E<br /><br /><br /><blockquote class=3D"gmai=
l_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729f=
cf; padding-left: 1ex;"><br /><br /><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #ad7fa8; padding-le=
ft: 1ex;"> Signed-off-by: Artur M=C4=85drzak &lt;artur@madrzak=2Eeu&gt;<br =
/> ---<br />  scripts/lib/wic/<a href=3D"http://help=2Epy">help=2Epy</a>   =
               |  2 ++<br />  scripts/lib/wic/<a href=3D"http://ksparser=2E=
py">ksparser=2Epy</a>              |  1 +<br />  scripts/lib/wic/<a href=3D=
"http://partition=2Epy">partition=2Epy</a>             |  1 +<br />  script=
s/lib/wic/plugins/imager/<a href=3D"http://direct=2Epy">direct=2Epy</a> | 1=
1 +++++++++++<br />  4 files changed, 15 insertions(+)<br /><br /> diff --g=
it a/scripts/lib/wic/<a href=3D"http://help=2Epy">help=2Epy</a> b/scripts/l=
ib/wic/<a href=3D"http://help=2Epy">help=2Epy</a><br /> index bd9c62e2e8=2E=
=2E2ac45e052e 100644<br /> --- a/scripts/lib/wic/<a href=3D"http://help=2Ep=
y">help=2Epy</a><br /> +++ b/scripts/lib/wic/<a href=3D"http://help=2Epy">h=
elp=2Epy</a><br /> @@ -970,6 +970,8 @@ DESCRIPTION<br />                   =
           This option cannot be used with --fixed-size<br />              =
                option=2E<br /><br /> +         --part-name: This option is=
 specific to wic=2E It specifies name for<br /> GPT partitions=2E<br /> +<b=
r />           --part-type: This option is specific to wic=2E It specifies<=
br /> partition<br />                        type GUID for GPT partitions=
=2E<br />                        List of partition type GUIDS can be found =
here:<br /> diff --git a/scripts/lib/wic/<a href=3D"http://ksparser=2Epy">k=
sparser=2Epy</a> b/scripts/lib/wic/<a href=3D"http://ksparser=2Epy">ksparse=
r=2Epy</a><br /> index 99b66eebc5=2E=2E7850e81d2f 100644<br /> --- a/script=
s/lib/wic/<a href=3D"http://ksparser=2Epy">ksparser=2Epy</a><br /> +++ b/sc=
ripts/lib/wic/<a href=3D"http://ksparser=2Epy">ksparser=2Epy</a><br /> @@ -=
144,6 +144,7 @@ class KickStart():<br />          part=2Eadd_argument('--no=
-table', action=3D'store_true')<br />          part=2Eadd_argument('--ondis=
k', '--ondrive', dest=3D'disk',<br /> default=3D'sda')<br />          part=
=2Eadd_argument(&quot;--overhead-factor&quot;, type=3Doverheadtype)<br /> +=
        part=2Eadd_argument('--part-name')<br />          part=2Eadd_argume=
nt('--part-type')<br />          part=2Eadd_argument('--rootfs-dir')<br /><=
br /> diff --git a/scripts/lib/wic/<a href=3D"http://partition=2Epy">partit=
ion=2Epy</a> b/scripts/lib/wic/<a href=3D"http://partition=2Epy">partition=
=2Epy</a><br /> index b623bb9e6d=2E=2E66e61ba70c 100644<br /> --- a/scripts=
/lib/wic/<a href=3D"http://partition=2Epy">partition=2Epy</a><br /> +++ b/s=
cripts/lib/wic/<a href=3D"http://partition=2Epy">partition=2Epy</a><br /> @=
@ -51,6 +51,7 @@ class Partition():<br />          self=2Eno_table =3D args=
=2Eno_table<br />          self=2Enum =3D None<br />          self=2Eoverhe=
ad_factor =3D args=2Eoverhead_factor<br /> +        self=2Epart_name =3D ar=
gs=2Epart_name<br />          self=2Epart_type =3D args=2Epart_type<br />  =
        self=2Erootfs_dir =3D args=2Erootfs_dir<br />          self=2Esize =
=3D args=2Esize<br /> diff --git a/scripts/lib/wic/plugins/imager/<a href=
=3D"http://direct=2Epy">direct=2Epy</a><br /> b/scripts/lib/wic/plugins/ima=
ger/<a href=3D"http://direct=2Epy">direct=2Epy</a><br /> index 60317eed22=
=2E=2Ebdb8385620 100644<br /> --- a/scripts/lib/wic/plugins/imager/<a href=
=3D"http://direct=2Epy">direct=2Epy</a><br /> +++ b/scripts/lib/wic/plugins=
/imager/<a href=3D"http://direct=2Epy">direct=2Epy</a><br /> @@ -366,6 +366=
,10 @@ class PartitionedImage():<br />          for num in range(len(self=
=2Epartitions)):<br />              part =3D self=2Epartitions[num]<br /><b=
r /> +            if self=2Eptable_format =3D=3D 'msdos' and part=2Epart_na=
me:<br /> +                raise WicError(&quot;setting custom partition na=
me is not &quot; \<br /> +                               &quot;implemented =
for msdos partitions&quot;)<br /> +<br />              if self=2Eptable_for=
mat =3D=3D 'msdos' and part=2Epart_type:<br />                  # The --par=
t-type can also be implemented for MBR<br /> partitions,<br />             =
     # in which case it would map to the 1-byte &quot;partition type&quot;<=
br /> @@ -519,6 +523,13 @@ class PartitionedImage():<br />              sel=
f=2E_create_partition(self=2Epath, part=2Etype,<br />                      =
               parted_fs_type, part=2Estart,<br /> part=2Esize_sec)<br /><b=
r /> +            if part=2Epart_name:<br /> +                logger=2Edebu=
g(&quot;partition %d: set name to %s&quot;,<br /> +                        =
     part=2Enum, part=2Epart_name)<br /> +                exec_native_cmd(&=
quot;sgdisk --change-name=3D%d:%s %s&quot; % \<br /> +                     =
                    (part=2Enum, part=2Epart_name,<br /> +                 =
                         self=2Epath), self=2Enative_sysroot)<br /> +<br />=
              if part=2Epart_type:<br />                  logger=2Edebug(&q=
uot;partition %d: set type UID to %s&quot;,<br />                          =
     part=2Enum, part=2Epart_type)<br /> --<br /> 2=2E13=2E6<br /><br /> --=
<br /><hr /><br /> Openembedded-core mailing list<br /> Openembedded-core@l=
ists=2Eopenembedded=2Eorg<br /> <a href=3D"http://lists=2Eopenembedded=2Eor=
g/mailman/listinfo/openembedded-core">http://lists=2Eopenembedded=2Eorg/mai=
lman/listinfo/openembedded-core</a><br /></blockquote><br /> --<br /> --<br=
 /> Regards,<br /> Ed<br /> --<br /><hr /><br /> Openembedded-core mailing =
list<br /> Openembedded-core@lists=2Eopenembedded=2Eorg<br /> <a href=3D"ht=
tp://lists=2Eopenembedded=2Eorg/mailman/listinfo/openembedded-core">http://=
lists=2Eopenembedded=2Eorg/mailman/listinfo/openembedded-core</a><br /></bl=
ockquote></pre></blockquote></div><br>
-- Wys=C5=82ane za pomoc=C4=85 K-9 Mail=2E</body></html>

------3VTK7FFH35H7DM2AKLAITCSKFWLS2U--
