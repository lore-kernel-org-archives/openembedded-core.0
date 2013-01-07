Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsAPM-0004Ud-2D
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 11:58:20 +0100
Received: from mail-yh0-f70.google.com ([209.85.213.70])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 02:43:09 -0800
Received: by mail-yh0-f70.google.com with SMTP id f73so13858815yha.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 02:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=LOzZW/0yqiPI/deP/M7TdY1N8OygEAC79qaH9BgGeCE=;
	b=JTGghZTEeZkM+c5zDicjMFBP54eUwQiMcKtiLo5aFHNJ6n+1SzORI+lliPlWOvIu/L
	ECU5BpnZYdr84HwIm5coa6fcrlYS41hgEVLov8kAdk3/I4+aIpFN7uiPtxXr0Fa4CBkN
	7ELLj3aMKlZIJycLiFtrPH4W4rFL9gRbDWXETFXcHPnmytqpZG3RRbOFBgU94EQh72pN
	vARpvmooGu0+2tnaKEMm1Cv6Lw+zCM9mJL+jQbbLRFbMIRGPdXLFIbxGNtnuhgb7dWti
	H8XFZfqPXO/eQM+R+fGmNTu8tIeVSReuv2u+1UiLmSnusLfM1R22nwq7mGLa9zUOo70H
	rluw==
X-Received: by 10.220.240.141 with SMTP id la13mr81085406vcb.39.1357555388110; 
	Mon, 07 Jan 2013 02:43:08 -0800 (PST)
Received: by 10.220.240.141 with SMTP id la13mr81085402vcb.39.1357555388031;
	Mon, 07 Jan 2013 02:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 02:42:47 -0800 (PST)
In-Reply-To: <1357471039-3056-1-git-send-email-lei.yang@windriver.com>
References: <1357471039-3056-1-git-send-email-lei.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 10:42:47 +0000
Message-ID: <CAJTo0LZDM2a99863Ps3APmUKhdYj9r4t0nefFU6Q93s+YQhBew@mail.gmail.com>
To: lei.yang@windriver.com
X-Gm-Message-State: ALoCoQlsjS5vL/gWwSRRuNeZClajAM9tzKImzhqbZbzCUK3DbTUZzUYqhUwU1cBqPxelcC6KzxS8c4+Q7kPh5BVE1IUfcdOLLFOaIuU8lWugDBEv/68ni2ns07JED6xjoBeHxQBO8uvn4C8GUVmDc6MrZ9eNqHoQjD9Xc787eWaKbwI8Cm0heOP+8gAGWWKiIH9BLMzVwh9r
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove the redundant "/"
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
X-List-Received-Date: Mon, 07 Jan 2013 10:58:20 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2013 11:17,  <lei.yang@windriver.com> wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>

The commit message should say what file was modified.

Ross


