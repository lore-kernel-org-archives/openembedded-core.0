Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id BBFAB6B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 13:25:42 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id s9so7008996iec.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+fMANpg2srzzYyxZp2ISLrem8khMu3wXe9Fcfwhbj6Q=;
	b=nJ+SRau4h9/IWrhgeVfILwr2AC5IJW3Hb9eUIKF/lPOTn9XghbtgsBV6MNAqWPabMc
	FjSBlrqRRGkKx9+e9uEaXnNujDqNS1+Y+MOzo0BLE5UQ4+1raer4iEtj3TZKdR8WlzcA
	6X5xbnr4YHP8q3H+cBccVYFt38n6Nl25HXHn+TqhElkkRI8kGNuayapf2OySC7k9j2V6
	ogP62Ua6gLahReQbN0iFeMJWwn6BKB6LCL8Ixww7LLJWxfbDibiQ5rdOLS0zycXax7MN
	hdnw+tPa8g8vHY8Hv2eRZ/rJueHWewqVcuHI7JXCAL3NX8uFkbWDrJtghjusEqjayObt
	dYGA==
MIME-Version: 1.0
X-Received: by 10.50.127.139 with SMTP id ng11mr12255578igb.6.1374153943381;
	Thu, 18 Jul 2013 06:25:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.9.113 with HTTP; Thu, 18 Jul 2013 06:25:43 -0700 (PDT)
In-Reply-To: <CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
	<CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
Date: Thu, 18 Jul 2013 10:25:43 -0300
X-Google-Sender-Auth: 8MT7bNXPs15NWnikH7xIthxV-Lc
Message-ID: <CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 13:25:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 18, 2013 at 10:13 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 July 2013 13:33, Daiane Angolini <daiane.list@gmail.com> wrote:
>> I'm facing the following error. Anyone know what I should try in order
>> | configure: error: Package requirements (glib-2.0 >= 2.28.0    atk >=
>> 1.29.2    pango >= 1.20    cairo >= 1.6    gdk-pixbuf-2.0 >= 2.21.0)
>> were not met:
>> |
>> | No package 'cairo' found
>
> cairo is a build dependency on GTK+, so I'd recommend having a look at
> the config.log file it generated and see if that has any hints.

Well, the error seems very clear. cairo pkgconfig is not found.

Did you build GTK lately Ross?

> (also, this is best discussed on the support list at yocto@)

I don't agree. This is a build failure and this works in previous
revisions of OE-Core/Poky so it is clearly a regression.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

