Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNYwI-00014O-SZ
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:17:03 +0200
Received: by ewy5 with SMTP id 5so1370833ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 16:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=OJt24xPH8VUfsCWCv8TSKWwj+9beoAOEfluqotnyOgs=;
	b=ImLkoNfAT+6HEm+1oYH+fwms9aQeI4HaFVbf0AsYxq4+JdV54+ZnbVUveHumF+efq1
	KGc/q5CaUKjDlS5fu9AD/dUJn3btxc6eC60A7qmfUOvRg0i7FBweeG3l6RSxFl/292Wy
	o906wGy2HthQgzzhoWkOzagC3etWayJ+fFno0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=IfcgShuxMUQBtVH/Z0f9lehx8mlbmY8jaeX9Pt9m54laMFtzNw27+9JdaRdXuUyHdO
	GHjIMRQIMtZaiA6k3S9QJdM/fndseuyiMqwcCTsGI/vqp8+3p5wcTLbNSrS1sLDeaWmX
	dKvVyhrJ/UZhkFWlZyMVyD7U3zbPySMbxxNK0=
Received: by 10.14.9.18 with SMTP id 18mr43267ees.236.1305933245559; Fri, 20
	May 2011 16:14:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Fri, 20 May 2011 16:13:35 -0700 (PDT)
In-Reply-To: <1305932236.3424.676.camel@rex>
References: <cover.1305848960.git.raj.khem@gmail.com>
	<0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
	<1305892146.3424.595.camel@rex>
	<BANLkTi=rbaGo8DX1CzDmKfgWWsRd=gkm3Q@mail.gmail.com>
	<1305932236.3424.676.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2011 16:13:35 -0700
Message-ID: <BANLkTinv=9GZD-7t44GpKFCexyP1f4=EiQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Fri, 20 May 2011 23:17:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 20, 2011 at 3:57 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-05-20 at 11:28 -0700, Khem Raj wrote:
>> On Fri, May 20, 2011 at 4:49 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > This needs to be $D, I didn't miss the brackets in my previous email :)
>> >
>> >
>>
>> but that wont be relative right ? it will encode current builddir into
>> sstate isnt it ?
>
> No, that is what the ${D} you used will do.
>
> $D gets set when we run the postinstall to the path to the rootfs (see
> the rootfs bbclass files). We use $D deliberately so bitbake doesn't
> expand it (as used elsewhere in postinstalls).
>

hmmm ok I see yeah ${} will get expanded by bitbake. Will make the
change and resend

> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


