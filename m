Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6XY-0007lD-Rs
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:55:28 +0100
Received: by lahd3 with SMTP id d3so1251444lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=QFo/LiO2J/CvSw52MIcmCAZUZpF9lR6lATjmFNjDj3c=;
	b=ffiUx7tpUJZ/+ZwJnlOiHGPaLE8tAAp4Py4tFAq+hKXLj/vBJxTP8FQXaLiF7YrwKK
	BDLL3emW1aumaaKbIynmWNXsBZVSNJQ9uYQ77RIUUWaCXw3PtC6x1f3S8sPmNkuTYSPR
	4DomQCcQY92mzyny8nJPHv2PPrwqUt3x43YWs=
Received: by 10.152.104.103 with SMTP id gd7mr5733864lab.34.1323460117308;
	Fri, 09 Dec 2011 11:48:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:48:06 -0800 (PST)
In-Reply-To: <4EE2656D.7090706@linux.intel.com>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
	<CAMKF1spMGdCj6-hU96gfvvQOgUwOerRtNGgFZk=5jDhAD96tTQ@mail.gmail.com>
	<CAP9ODKrH8hZ=fiD82vJMMopJ1grKEcZw07pPy7a1PNFtb_gq0w@mail.gmail.com>
	<4EE2656D.7090706@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:48:06 -0800
Message-ID: <CAMKF1spCaqApQttDA_vR7FwVy4KLOmTQY3u4XPGF+whUk2k9AQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
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
X-List-Received-Date: Fri, 09 Dec 2011 19:55:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 11:45 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> On 12/09/2011 11:36 AM, Otavio Salvador wrote:
>> On Fri, Dec 9, 2011 at 17:34, Khem Raj <raj.khem@gmail.com
>> <mailto:raj.khem@gmail.com>> wrote:
>>
>> =C2=A0 =C2=A0 why do you want to avoid cover letter ? or is it for other=
 layers
>> =C2=A0 =C2=A0 other than oe-core
>>
>>
>> When it is a single patch makes no sense to send a cover letter that
>> most of time we just write the same of first commit.
>
> Well, you could just use git-send-email when there is only 1 patch.

right

 I
> had considered having the tool create only a single email if there was
> only 1 patch. However, in the end, I just send the cover letter with the
> pull requrest and let the single patch follow. It works fine and is
> consistent with the other patches, even if it is a degenerate case.
>
> So I don't think this is necessary really, but if it works for you and
> doesn't get abused, I'm fine with it. Perhaps only allowing this if
> there is indeed only 1 patch would be better.

if its possible it will happen abuse that is


