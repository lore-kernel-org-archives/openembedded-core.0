Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tli9t-00072P-6U
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:35:41 +0100
Received: by mail-oa0-f42.google.com with SMTP id j1so3525106oag.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 07:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ukA90MndcaXB/I78V9kIcAkEnmt86hMkPb2JGqZACPE=;
	b=tmslsvOHGJCDuHtcoPEFkCxVE+cdZOPCjW/nFBB0a55sE6PEmP49vJ/0jbSVZewqUr
	x6IAcYi0cScp9sLs355BIvKlZYkUaX6m7dSkd2ZIu+TVX9IeRq2OzEoV0x2to7cKCKZo
	5vdb6TRqaGVEinrmMLBLKk+WW0tZcJj6MnJ1xXavTEcDwVtUOwwGkWC8y0zX2is2BLW0
	Jc7yOWsIuKUQrXjmPVBl4OCl6l/Xo8fAVTGbDD+Va9JmE1GRHzRTsTHZrjo1quiCmP3G
	ZmN+8S1IQ6BhIlm8bWJcc7+yOuo7HqDcovZylWPEZeHZlbbF2v8eJhEwJU4wom935aJF
	V8mg==
MIME-Version: 1.0
Received: by 10.60.171.201 with SMTP id aw9mr8112987oec.126.1356016856120;
	Thu, 20 Dec 2012 07:20:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 07:20:55 -0800 (PST)
In-Reply-To: <CAJTo0LZPiEz6RcQuckppAfF0YZ9B=0pmsP+iJgNG3n0RvV1j4w@mail.gmail.com>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
	<CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
	<CAP9ODKrrSKgd4oFc06Ea=qero4i8Lc1awT7NH_+WwbZru0+XEQ@mail.gmail.com>
	<CAJTo0La6DRoi8vfbn+qDad5Zm1fpceKfTpRZ=1e07XL79eBswA@mail.gmail.com>
	<CAP9ODKpt8gcfkm=59q-HGFcN12uZ+qJ5ZPJanyNCBtYj3BEc7w@mail.gmail.com>
	<CAJTo0LZPiEz6RcQuckppAfF0YZ9B=0pmsP+iJgNG3n0RvV1j4w@mail.gmail.com>
Date: Thu, 20 Dec 2012 13:20:55 -0200
X-Google-Sender-Auth: OTUUKbWBGkyiSw1DcwWwMO5G3J0
Message-ID: <CAP9ODKoY3-vKaa-GDRytjGzFwEFR3KX0uwufXQszAujmQ5oOLg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 15:35:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 12:31 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 December 2012 13:09, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> I think if I enable systemd feature I do expect to have some systemd
>> libraries in rootfs however I may opt to use it or not. If I do want
>> to have *no* systemd libraries, than I should not have systemd feature
>> enabled.
>
> What's the point of enabling systemd, having the libraries installed,
> and then not using it?
>
> I don't see what the appeal of supporting multiple init systems a
> single distribution, with the downsides of doubling the test space and
> wasting space in situations where you ship all the systemd libraries
> but don't actually boot with systemd.

Here at O.S. Systems we share same distro and packages among different
products and some use sysvinit and other systemd. I think it is a
valid use case.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


