Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id E6F166F8F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 18:49:05 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id uo5so1358520pbc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=JRKJZa5vMEuNjs+0IdnmEtFIBwtAU9Scp8YwFFZfn0c=;
	b=IdMMBNxRvFL0mQ4X7qx0U3XrnCIPxBW2aKW0B2XEjCVStHjJpvIcY3OuZDuLppLmpf
	NICRa+DYVL/6B6eZ+Eev9HCtyqP6aFwEnYmzc3iHComThPV+h+oh0wbkodpHEKnFzvR2
	hBzxPYd03pkNc0Wd4afF7ULplUN+/CByc9ZBJ/8iOak1/wu1LRcJakdyJQ8RLPqfF2ra
	opL5/Fkxh+asZ4wkcRflB5zjb2GfwaDXapGqRN9qO+/7fif0A+C7ihGfqJuNcBLkTsgO
	nPWHbYsjkTuPOqIRe2Za5NrLxrw4oX2kQXKSGP79I805cgO7DGYJPZcbcjFwb9Douk+U
	EOUg==
X-Gm-Message-State: ALoCoQkVtaGt1WtPrbmJNWIjtVSCs6eAFk2jzlsMyCDwYEJglSy9tWhskR6cfdwFwUFpbu/veL9q
MIME-Version: 1.0
X-Received: by 10.66.163.138 with SMTP id yi10mr48902121pab.95.1395341346668; 
	Thu, 20 Mar 2014 11:49:06 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 11:49:06 -0700 (PDT)
In-Reply-To: <CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
Date: Thu, 20 Mar 2014 18:49:06 +0000
X-Google-Sender-Auth: QQ0zimmU3mgZBY5FAv-y73vIEyQ
Message-ID: <CAOMwXhNx8XFYQhKytm88YtCfqPxAgOcB4VnNgwDfqkng2aN1uA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 18:49:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 1:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 March 2014 12:44, Laszlo Papp <lpapp@kde.org> wrote:
>> You are free to NACK without an explanation why it is important, but
>> do not expect it to weigh much that way, at least in my eyes, based on
>> that you are not even a maintainer as far as I know.
>
> One good reason: systemd reads the LSB headers.

This init script is for SysV, not systemd.

