Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwaCJ-0001UL-N7
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:46:51 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 07:35:11 -0700
Received: by obbuo19 with SMTP id uo19so10550546obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=L0lu7VlbHxUim0TCpvHL1RTD677Du9owp/83UwGbLSs=;
	b=XDr3Rve182HZmR+OCu3SmUKtUgqUyoLvRhougb0IceDiln5DL5kmcJdIIGC5mL+OPq
	N/HYLD/BW+gnqV9TJwHMchG1r+rLvEbv9c3XW8YVyRXq4xX0rGtx4e7vcIp0UlGP+1R2
	3bjovaHvIrQVy1RDjXwKhTXSnudmwo2ZoHQgtzQzWEuEM493qyt3hkenR+Zg0llc+INp
	kRP6p8xwD9G/g7XW30/iabZhbgLm1DPgfMfZQ13pw5EOIPsiU9H84D7SAqyAwlyWvLId
	Z3BcD6piRCM5+lUFnOGFaaQenpeefSPqRySzJP0RA5zPih9ZTnv8Blm2Nj5v3x/AdUBb
	VHNA==
Received: by 10.182.131.73 with SMTP id ok9mr29354081obb.19.1343831711027;
	Wed, 01 Aug 2012 07:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 07:34:50 -0700 (PDT)
In-Reply-To: <17FC0BB5-80B8-4AB8-A3E8-57261EB7D561@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAJTo0LbVvVqDSPpUs36JTROeq6fWendJwaVQDataN_nD6O=+Ew@mail.gmail.com>
	<17FC0BB5-80B8-4AB8-A3E8-57261EB7D561@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 15:34:50 +0100
Message-ID: <CAJTo0LaJ9mM_yyU+ZYoDACig5E30qBaPU+Y5BDTrrA1bOdK78A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkgSRDUxrODA4WBuiMEEGGYVpYa89iBxkr9YWETfFMJrzXjB3iZuqZENH+REw91x/Xks7gv
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
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
X-List-Received-Date: Wed, 01 Aug 2012 14:46:51 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2012 15:33, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Rename the mesa ones to libegl-mesa (etc), and encourage TI to use libegl-ti?
>
> Recipe names don't matter, the .so files in sysroots and shlibdeps do.

I meant the name of the generated package.  libegl-mesa and libegl-ti
shipping the same libraries is expected and desired.

Ross


