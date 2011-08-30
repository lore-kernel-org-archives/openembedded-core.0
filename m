Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1QyWi1-0002Vy-SN
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 00:23:06 +0200
Received: by qyk4 with SMTP id 4so3190540qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=DW3txye7/SpdxUgBDTe1YfHk2/Lclfb6dCaRyf+1XNg=;
	b=nOzrmgeXLvI3hWSMBNo49/bmqUjRAUd7POK3W71raCprqevIq6cHBQ2bi5fIinWsMM
	2VmjS5Y7m192c4GjCSyaLqK8qW63o/rOwHMAR6sVG5XIwQi1GHBgw75/07FAH3FDTY2r
	D/OEAZfxVbPWR1QWTPcaJsSqH9qU9cos+psZ8=
MIME-Version: 1.0
Received: by 10.229.47.213 with SMTP id o21mr7115102qcf.278.1314742691698;
	Tue, 30 Aug 2011 15:18:11 -0700 (PDT)
Sender: seba.dos1@gmail.com
Received: by 10.229.232.207 with HTTP; Tue, 30 Aug 2011 15:18:11 -0700 (PDT)
In-Reply-To: <4E5D605E.3030303@hs-augsburg.de>
References: <1314738793.5939.427.camel@rex> <4E5D605E.3030303@hs-augsburg.de>
Date: Wed, 31 Aug 2011 00:18:11 +0200
X-Google-Sender-Auth: rWql7cQvKqfpoScMJp1lx-ZkY1M
Message-ID: <CAMkzfpaQEHWQaDt_JGZ9J6dYK40gu6W4RM9hMOcQc+5didPuSw@mail.gmail.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
To: michael.morscher@hs-augsburg.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: upgrade from 7.3 to 7.3a
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
X-List-Received-Date: Tue, 30 Aug 2011 22:23:06 -0000
Content-Type: text/plain; charset=UTF-8

On 8/31/11, Michael Morscher <michael.morscher@hs-augsburg.de> wrote:
> Hey,
>
> Thanks for the recent patch, but the patches need another handwork:

Whoops... I wasn't able to test it, as one of gdb's dependency was
failing to me due to bug in gcc. Anyway, I'll try to fix it later,
thanks for info.

-- 
Sebastian Krzyszkowiak
dos


