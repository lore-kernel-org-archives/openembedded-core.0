Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QU1XA-0000PA-EB
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 21:01:48 +0200
Received: by yxi11 with SMTP id 11so1566813yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Qhpvl3RgCi7Ms1Dw6nEp4W/uIiC+HRgAEQqx0jy+aHY=;
	b=wBrs1VaaesJK8t34/JvPg9XKyymBbfhuYYIRFXg9YzcHDZpy6OaAnEgNgIfr7OqzMH
	/VumqnnXOijxlCfIt32HOavqd3FlCsVfKBZb3vDEucIIcj5GdlaPTcn4Zy9ovinb9Hc0
	dyodRVNi4MzDNZk+P4ql6oxD7nsh4Kh39cVK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=GvPTNA0RmlrDwSIbScAKHa2mtnC6CeNQPaCxwRWRbyfkDcqDsWSOW4b2hwCp0xB+Je
	VxZ01YrXTpiu3ds96c0sm9eqqigf/lKPAmaXyiLAV5Ox3UrIod9JIemRTTCSzfKJQXdj
	fHbcx9wXDynDbY1+WJ+3uj4tFKGy7ZdoaUHas=
MIME-Version: 1.0
Received: by 10.236.144.230 with SMTP id n66mr955599yhj.17.1307473109257; Tue,
	07 Jun 2011 11:58:29 -0700 (PDT)
Received: by 10.236.202.69 with HTTP; Tue, 7 Jun 2011 11:58:29 -0700 (PDT)
In-Reply-To: <201106071712.50973.paul.eggleton@linux.intel.com>
References: <201106071712.50973.paul.eggleton@linux.intel.com>
Date: Tue, 7 Jun 2011 14:58:29 -0400
Message-ID: <BANLkTimAp1ZNVfBJKkLbmm5ZB+=Usz16Hw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@lists.linuxtogo.org
Subject: Re: Layer index wiki page
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
X-List-Received-Date: Tue, 07 Jun 2011 19:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2011 at 12:12 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi all,
>
> I've created a wiki page to provide a central index of all layers that ca=
n be
> used with oe-core:
>
> =A0http://www.openembedded.org/index.php/LayerIndex
>
> This is by no means complete - I started with the list from Cliff's chang=
elog
> and added a few on from there. I was also looking around for a page with =
the
> =C5ngstr=F6m setup instructions that specifically mentions being oe-core =
based but
> I couldn't find it (Koen?) I'm still thinking about how to best represent=
 layer
> repos that contain multiple layers too (e.g. meta-oe, meta-smartphone, et=
c.).
>
> Comments / updates / additions welcome.

Looks good.  I've added meta-yocto to the weekly changelog report:

http://cgit.openembedded.org/cgit.cgi/openembedded-admin/commit/?id=3Dd017d=
c35791f100799213cf20de58cd0423b348f

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


