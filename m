Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5K1p-0008Qj-5r
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:52:26 +0100
Received: by mail-ie0-f178.google.com with SMTP id c13so468741ieb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 09:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=M95LwD5994WqQ6DWlFB52vtDK7q6a/2UWsahi1hzAbk=;
	b=F+5FCt37n0fnwEUFiIDGV2Ehmh2ZSu+VjG4MQmoH5Vyi6ZicynZAv39e6j8OLaDYYy
	EtlIN2jerybtb0kU0DCqyRSzTgD4GeLGWZbuziMrZFzJEaXnDlLhD5e/bHm8qPCJ58YY
	5raNrjKOID5OWI9rIUvlaQQIyMBk3AfdJ/MtQlDsNuW1YAWiznAo5CMLe1wkhpnwYj+m
	id0kZzjfEMN8IUGTKnpRtGOYcpVx2gM8RYj5yMsDaPACyyL38dZwrC0Y5lVSaNNl0oHH
	rN0XpkT06JhRfaNlCBp4v7O1HaDMvZlNKg7OLCIKB/F1VLlMDMGKzccx+n2YmM6OtbrO
	MkDA==
X-Received: by 10.50.56.232 with SMTP id d8mr4843009igq.112.1360690584563;
	Tue, 12 Feb 2013 09:36:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Tue, 12 Feb 2013 09:35:54 -0800 (PST)
In-Reply-To: <C7C45274F728429FA76E2C1C47BACCDC@intel.com>
References: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
	<C7C45274F728429FA76E2C1C47BACCDC@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2013 09:35:54 -0800
Message-ID: <CAMKF1srbNA_RLGC06zOC=Y4Av9ZGaL6G+Wk=u05-cCZtuRyMyA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Add systemd package to PACKAGE var
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
X-List-Received-Date: Tue, 12 Feb 2013 17:52:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 12, 2013 at 1:08 AM, Ross Burton <ross.burton@intel.com> wrote:
> On Tuesday, 12 February 2013 at 08:22, Khem Raj wrote:
>> If someone defines SYSTEMD_PACKAGES to be different
>> then ${PN} then we need to make sure that they get
>> added to PACKAGES variable
>
> The only case it won't already be in PACKAGES is if you're creating a package which contains just the service file, which as I've said before isn't recommended - package the service files along with the binaries that they are executing.
>
> Or is there another use-case I'm missing?


Thinking about it from different perspective, I agree that probably
adding an extra package is not right and having unitfiles as part of
package proper is fine. but we should definitely have a check where if
SYSTEMD_PACKAGES dont exist in PACKAGES then it should error out or
warn about it.

>
> Ross


