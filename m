Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyNVd-0002KH-3J
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:10:29 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 05:53:46 -0800
Received: by mail-vc0-f197.google.com with SMTP id gb30so14341190vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 05:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=ByO/WcCwla63GlHFDuJaqZd+4CgNB7zBbjTXNwSPbz0=;
	b=JQqHGp3U094hWZj5GaSP1FVmtGVUnTAuBWDpb8twws0Rm4ZydlTYXX2GKRA4bzoiVh
	VWu1KK0gSLTmTRCglJ7aYZ6nhGR5Puek2PYpL0Ut6OQTjPHIfgT3v2Hfrmw62OyHZGUQ
	nkiq3sG/uKlJ/rjbg5jOJP5uUdRPWJQ8b7o87yRp9omuD4JgSba8CIegaPPwYIVnT4Ni
	MWV5M/QBgZdRp+GPoB38ULLcjSlX1dyKU3zCFVnAa3P7iOCfaI5kx/dRvUbeutAWssyz
	Ih1+Rs1HhbNyfaBL7vgP9zKA7+lzE8EVxq/yCdv3j9OU5L0qDUZAeL/u7WY42iBSzzpb
	jK9A==
X-Received: by 10.52.72.137 with SMTP id d9mr1608641vdv.105.1359035694560;
	Thu, 24 Jan 2013 05:54:54 -0800 (PST)
X-Received: by 10.52.72.137 with SMTP id d9mr1608630vdv.105.1359035694417;
	Thu, 24 Jan 2013 05:54:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 05:54:34 -0800 (PST)
In-Reply-To: <51012AE1.7060905@balister.org>
References: <985E5BBDA0968D48ABDF343456A521B3F1300F@IRSMSX102.ger.corp.intel.com>
	<CAJTo0Lbjvedo-1YPQmM2uEv_44aUh9eoo45BCpXg6U=rH+f0mw@mail.gmail.com>
	<51012AE1.7060905@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 13:54:34 +0000
Message-ID: <CAJTo0LbtvKV3V5sKTbZ5j9GDu5xFfLgVicd6o74aW2NT0OArKw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Gm-Message-State: ALoCoQlLux0Nm8XPyeD6VTnrxlsidcHVFkitoyBlNc28J7Q02f1dBSYrISHd8bx/6y9MryhAPMSE0DknOGDgS2FFkHX5Gf5ufEWkTQE2itHmVlC1Fx5eMcICwMcSaULVFswsvmyEBvRwPJB5hhDKx33aZS8ujsAnZaVmzb+IqRNQT5RU60rKD5P+hjZ20zJgCp38TrJos4vu
Cc: yocto@yoctoproject.org, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Meta-web-kiosk Layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 14:10:30 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 12:36, Philip Balister <philip@balister.org> wrote:
> On 01/24/2013 07:12 AM, Burton, Ross wrote:
>> On 24 January 2013 12:03, Ciobanu, Emilia Maria Silvia
>> <emilia.maria.silvia.ciobanu@intel.com> wrote:
>>> I've created a new layer that can be used for kiosk devices.
>>> You can check it out at:
>>>     http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/
>>
>> Excellent, good to see it not hidden away!
>
> It is hidden until it appears on the Layer index :)
>
> http://www.openembedded.org/wiki/LayerIndex
>
> Please add it there.

Yes, it should be on the layer index.  Emelia, can you update the wiki?

Ross


