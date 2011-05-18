Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMnDt-0000xM-8L
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 22:20:01 +0200
Received: by eye27 with SMTP id 27so595185eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=B3o/Q8NWMDWzrqSNbTV/buLR/OlyLdK6iM8++DV+WxM=;
	b=GM1IMdrw9zaZaXmD5zVa4h2/mS7uO0SF9+2pnenYBrxJ9k1Cm8PIV+pYohm7p9uKgP
	3+u/DjsbKUOOBfoP328iMeC3sf6cr8wr8Aq/cLibygKiSW1aj/8InWYp0rhyzaeGVovf
	oiT2J+mJKcwSTsI3iNBzl5B/s1ct6Rqk3Iifs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cdKXdAFRFRJlz9cO+ifz0s935B+mtBw3LFdPXj0nMjNBzesD1hBcc+2G7Ymne1qvNp
	ZVxQojw7f6vUrRYWNrh/rySEqu/woWifQRMVR2ekJ6jxnOwlhTpib6YUDYGT0O3+H8VR
	aidLkcQkTc0Qt3uAHzHKWFBnKcXzq1/LsOYVY=
Received: by 10.14.7.198 with SMTP id 46mr862258eep.108.1305749826208; Wed, 18
	May 2011 13:17:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 18 May 2011 13:16:36 -0700 (PDT)
In-Reply-To: <1305749520.18415.167.camel@lenovo.internal.reciva.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
	<BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
	<BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
	<1305749520.18415.167.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2011 13:16:36 -0700
Message-ID: <BANLkTi=Y76uLa8miT-9ZA-bdqBvFFRXuxQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 20:20:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 1:12 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2011-05-18 at 11:07 -0700, Khem Raj wrote:
>> there are certain common parts that can be abstracted
>> and can be maintained in oe-core so everyone benefits
>> from it and certain image specific parts can be done in
>> distros. So keeping common parts in core would still
>> be better IMO
>
> Which are the common parts you're thinking of? =C2=A0I'm not sure there's
> anything in task-core-boot which all distros are guaranteed to want. =C2=
=A0If
> we're basically going to end up with a recipe which is just a list of
> distro-defined variable substitutions then it seems to me that a more
> readable way to achieve the same end is just to have the distro provide
> the recipe in the first place.
>

I was commenting in general on tasks and not specific to  task-core-boot

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


