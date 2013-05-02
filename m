Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXq21-0000yN-S4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 11:42:36 +0200
Received: by mail-vb0-f47.google.com with SMTP id x14so284429vbb.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 02:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=MCCLi+9948N8e+bcPYUkDEiERRmS6SakNhdDE4cBdHw=;
	b=dS+79BzKMzdhiyLD/W25iZlBLJ0kJQWgEgc3NphGyXJ+IDeSr0zmMtAOFlZhTMRsHp
	pYPTEEMB417K+zJAkeNdV5EvtJzaipC1jRXhFn719IAqaQ2NzZc3mX9dkhtYM7faBLxU
	6lxoSF9EtVKlaAcXZ4Fvw87qlczFubDumZWxch7wiEfzIkTGooVSEzqJuwa1nbGrvqnA
	0KaHOn/ZstFtZv7MrW6hX6BVyuqo/qop5uBVXIQ8H4eiJguerBF00ihdn9iKWxLi+pcQ
	/NmvccHNzY1vNKJztOLV+8sleZQKCAU6iNUTqVpC3btX//XvmilEhbS/GfJudMJXLWTR
	t5ag==
X-Received: by 10.52.18.206 with SMTP id y14mr1636836vdd.29.1367486670474;
	Thu, 02 May 2013 02:24:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 02:24:10 -0700 (PDT)
In-Reply-To: <CALRxmdD5r1MGDuDjBKHYcB9eLQ1FL9BZM5_QQxLNpQOcyOHvVA@mail.gmail.com>
References: <CALRxmdD5r1MGDuDjBKHYcB9eLQ1FL9BZM5_QQxLNpQOcyOHvVA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 10:24:10 +0100
Message-ID: <CAJTo0LYk3yyh3dXk5hmvbvpiv9fWNmgoZpYzUb_U9Kc6CsMELA@mail.gmail.com>
To: Stuart Yoder <b08248@gmail.com>
X-Gm-Message-State: ALoCoQndT90ASOvFlpiccX+p1xRXN5EPFkKdfK3e3OW5K3kQtgk3kL2dfMChaOEs1g8L/8cix3na
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: yajl: Installed (but unpackaged) file(s) found
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
X-List-Received-Date: Thu, 02 May 2013 09:42:44 -0000
Content-Type: text/plain; charset=UTF-8

On 1 May 2013 20:11, Stuart Yoder <b08248@gmail.com> wrote:
>    FILES_yajl="/usr/bin/* /usr/sbin/* /usr/lib64/yajl/* ...
>
> Ho do I get the yajl recipe to either a) build the files in lib64 or
> b) package them from lib.

Don't hard-code paths, instead use the symbols available in bitbake.conf:

FILES_yajl = "${bindir}/* ${sbindir}/* ${libdir}/yajl/*"

Ros


