Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tlg6I-0005PT-PD
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:23:51 +0100
Received: by mail-ob0-f174.google.com with SMTP id ta14so3230554obb.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5m6VkZH5rFwEnb6JeNNkUoMlNvNwxLCEmmM8zQsx2zY=;
	b=sWRTIBWWTmB+x2cmyKcBLsGJQzb1X+u6J4SwhkdFVltgVeorZCLrIRVPaZuX9Oxa3d
	8Zk4QcK2CSjBp/qrRAHb69fycvxp83/zFH2daXrLjtdp7HrhMxN9sVEKzzqx3d/r8VeC
	wBFtNo/98035JRj4aHjOQ9DCxHXtEvDBWdmCpEGYmsu6hFqkep+bTvR3X57hjPX2Nd0J
	9RGKNOs5PXcUcnVXEZE2+LOe2PUOHlJE48TWr7YzbuZEekc9CAKlDoqfhJFqXR/vTE5z
	Ncwk5HXNDLQ7afIYVU8lhLRlWRtTfFy43RJMZOLh932xnKKTuHuTX8Q20o6l+HasUP4Y
	N3lg==
MIME-Version: 1.0
Received: by 10.182.98.5 with SMTP id ee5mr7950230obb.28.1356008945895; Thu,
	20 Dec 2012 05:09:05 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 05:09:05 -0800 (PST)
In-Reply-To: <CAJTo0La6DRoi8vfbn+qDad5Zm1fpceKfTpRZ=1e07XL79eBswA@mail.gmail.com>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
	<CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
	<CAP9ODKrrSKgd4oFc06Ea=qero4i8Lc1awT7NH_+WwbZru0+XEQ@mail.gmail.com>
	<CAJTo0La6DRoi8vfbn+qDad5Zm1fpceKfTpRZ=1e07XL79eBswA@mail.gmail.com>
Date: Thu, 20 Dec 2012 11:09:05 -0200
X-Google-Sender-Auth: 0TBHSzJzaivrB_rkUAphtwhh4Yw
Message-ID: <CAP9ODKpt8gcfkm=59q-HGFcN12uZ+qJ5ZPJanyNCBtYj3BEc7w@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Dec 2012 13:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 10:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 December 2012 12:50, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Not really, I've been using sysvinit images and systemd images in OE
>> with meta-oe and it works fine.
>>
>> There're some changes need, indeed, but it is possible to make it
>> work. The biggest change I had to do is to get systemd-udevd using
>> init scripts.
>
> Sure it works, I never said it didn't work. It's just not optimal -
> dbus isn't using the superior console ownership information available
> to it through systemd for example, because that means linking to
> libsystemd-login.  By making systemd an image-time choice we can't
> ever have any code that requires systemd in the build.

I think if I enable systemd feature I do expect to have some systemd
libraries in rootfs however I may opt to use it or not. If I do want
to have *no* systemd libraries, than I should not have systemd feature
enabled.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


