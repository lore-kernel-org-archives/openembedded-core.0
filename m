Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8835477C25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 17:42:59 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 6E14B5C18B6;
	Wed, 29 Mar 2017 19:32:37 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 29 Mar 2017 10:42:49 -0700
From: Stefan Agner <stefan@agner.ch>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZS0OKSGiX2=6Q-dWFgGrKfF0VXhwq88wtHExTSP9iFpw@mail.gmail.com>
References: <1490741109-18909-1-git-send-email-stefan@agner.ch>
	<CAJTo0LZS0OKSGiX2=6Q-dWFgGrKfF0VXhwq88wtHExTSP9iFpw@mail.gmail.com>
Message-ID: <ace950db96fcfe4379dee1fa6c685c94@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1490808757; bh=wR6SUzs28eVS4D9L+LmBKh37b0iSc4nKZ59g7kYHrrI=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=iRIkkAiIeCWUYHqqSB4PVOlLscxm9EHZyPvDaUsvhoQlq8mlJj588fcqh3jaFJFnqF+AcPVkRCqj9nhXz3uxEsWuj/buoSjBjmA4KhOXsi626aaegBsEA6KkW1rlBITZ8LAr6tFboPEyd89unVUo4pqHAuQ/VAMYDUL8UQChRHo=
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] util-linux: make blkdiscard a separate package
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
X-List-Received-Date: Wed, 29 Mar 2017 17:43:01 -0000
Content-Type: multipart/alternative;
	boundary="=_8e866910daa5cf84484149e0f8f75ad3"

--=_8e866910daa5cf84484149e0f8f75ad3
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

 

On 2017-03-29 08:41, Burton, Ross wrote: 

> On 28 March 2017 at 23:45, Stefan Agner <stefan@agner.ch> wrote:
> 
>> @@ -30,8 +30,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>> util-linux-swaponoff util-linux-losetup util-linux-umount \
>> util-linux-mount util-linux-readprofile util-linux-uuidd \
>> util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \
>> -             util-linux-blkid util-linux-mkfs util-linux-mcookie util-linux-reset \
>> -             util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
>> +             util-linux-blkdiscard util-linux-blkid util-linux-mkfs util-linux-mcookie \
>> +             util-linux-reset util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
>> util-linux-partx util-linux-hwclock util-linux-mountpoint \
>> util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
> 
> We're growing a lot of packages containing a single binary.  Would it be sensible to group them into "file system tools", "process tools", etc?

Not sure if such a high level grouping is helpful. Just because an image
uses one fs utility, does not mean the others are used too. There might
be some potential on a lower level (e.g. util-linux-mkfs.cramfs and
util-linux-fsck.cramfs). 

Is having lots of single binary packages an issue? I guess package
management data adds some space overhead? In my case, I build a image
without package metadata, so I guess there is no overhead for the final
image (for the final image). 

Best regards, 

Stefan 
  

--=_8e866910daa5cf84484149e0f8f75ad3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>On 2017-03-29 08:41, Burton, Ross wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><!-- html ignored --><!-- head ignored --><!-- meta ig=
nored -->
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br />
<div class=3D"gmail_quote">On 28 March 2017 at 23:45, Stefan Agner <span>&l=
t;<a href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt;</span> wrote:<=
br />
<blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 .8ex; border-left:=
 1px #ccc solid; padding-left: 1ex;">
<div id=3D":yn" class=3D"a3s aXjCH m15b171ab2ecb0014">@@ -30,8 +30,8 @@ PAC=
KAGES =3D+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux=
-sfd<br /> <span class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; util-linux-swaponoff util-linux-losetup util-linux-umount \<br /> &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; util-linux-mount util-linux-readp=
rofile util-linux-uuidd \<br /> </span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs uti=
l-linux-fsck \<br /> -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;util-=
linux-blkid util-linux-mkfs util-linux-mcookie util-linux-reset \<br /> -&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;util-linux-lsblk util-linux-m=
kfs.cramfs util-linux-fstrim \<br /> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;util-linux-blkdiscard util-linux-blkid util-linux-mkfs util-linu=
x-mcookie \<br /> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;util-lin=
ux-reset util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \<br /> =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; util-linux-partx util-linu=
x-hwclock util-linux-mountpoint \<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; util-linux-findfs util-linux-getopt util-linux-sulogin util-l=
inux-prlimit"</div>
</blockquote>
</div>
<br />We're growing a lot of packages containing a single binary.&nbsp; Wou=
ld it be sensible to group them into "file system tools", "process tools", =
etc?</div>
</div>
</blockquote>
<p>Not sure if such a high level grouping is helpful.&nbsp;Just because an =
image&nbsp;uses one fs utility, does not mean the others are used too.&nbsp=
;There might be some&nbsp;potential on a lower level (e.g.&nbsp;<span>util-=
linux-mkfs.cramfs and&nbsp;<span>util-linux-fsck.cramfs).</span></span></p>
<p>Is having lots of single binary packages an issue? I guess package manag=
ement data adds some space overhead? In my case, I build a image without pa=
ckage metadata, so I guess there is no&nbsp;overhead for&nbsp;the final ima=
ge (for the final image).</p>
<p>&nbsp;</p>
<p>Best regards,</p>
<p>Stefan</p>
<div>&nbsp;</div>
</body></html>

--=_8e866910daa5cf84484149e0f8f75ad3--
