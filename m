Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RqvpF-0002u1-G7
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 01:07:25 +0100
Received: by obbuo9 with SMTP id uo9so2553063obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 15:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NsEhRQN92SIqdvwpUlER2IMVl9as05n79cb1i2L4uwc=;
	b=l/bWNxND6OMSdid4jyPIVGWhjv2tPe3f7crcGTkH+XoRPXJom7E74/NBoL7OF4VZlC
	rd4Ko7vXDkDefy9yw5KnxOK1rhzlWW9OVbanwCYGglF3nxzTdIHBzz+Dp+ZSiDVlw3Kj
	FowpOWaRJF/eohunVyDw25hqQbmJhaiUqzjEY=
MIME-Version: 1.0
Received: by 10.182.132.105 with SMTP id ot9mr8504451obb.34.1327708775489;
	Fri, 27 Jan 2012 15:59:35 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Fri, 27 Jan 2012 15:59:35 -0800 (PST)
In-Reply-To: <1327708020.7307.4.camel@ted>
References: <CAGDS+nnPcnUFG5xGgZzPFHrxQ4Nd75RGVjcuK-ycVQzNEp3aXA@mail.gmail.com>
	<1327708020.7307.4.camel@ted>
Date: Fri, 27 Jan 2012 15:59:35 -0800
Message-ID: <CAGDS+nmjhAND2YpuTor01EMvktPropb+r_oKr1SWEOxzAnG9Mw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: polkit broken?
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
X-List-Received-Date: Sat, 28 Jan 2012 00:07:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 27, 2012 at 3:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
>> My image does include systemd from meta-openembedded so I suspect that
>> may be a factor.
>
> I suspect so too.
>
>> For those who are building with sysvinti, do you see this issue?
>
> No, this looks like the version string for systemd is upsetting rpm
> somehow, probably the inclusion of a "-". The rpm backend is supposed to
> remap that character iirc...

I tested this on a second build machine and didn't encounter the error.

I then went back to the first build machine, did a 'bitbake -c
cleansstate avahi systemd' and then rebuilt the image.

Of course it built with no problems, so I'm not really sure what was
going on!  I'll try a clean build on another machine to see if it
re-occurs.  If not, it will be yet another addition to my "mysteries
of the universe" list :-)

Steve


