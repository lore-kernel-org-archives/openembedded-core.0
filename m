Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE7860034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 19:12:07 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so92906838pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=vhMQIYFlIP+7ot3Tpbkd77yaw2mn2L0UWhpgQi3bsAE=;
	b=I9pOLqWssmjqIIJHQcyE6qKpKguaA/a986A8MgFUzzcRuwF/wLPZ1Wwts+sPemquZM
	2t5BrzkRCOwHsA75AjwgAbMWvAZR0RkYIkUZSEDWqpnE72jz5s+Wo1F/DbPcyQBK20/C
	TdM96Yjtrc9COPcA46BuxsGa4uFT2S8bcNN83vvEUf3Z7V2EzxgThGkJ/l3EIt1VYE4/
	pFJ0eUuPGSKSC5NDLE5SI5zsgxSmKz8j6RknZlvhx397RFgC8FkdjtXBK1J9e8pQYwho
	ay7gIc8dg3AjmS1/CY436lOrZJijn27LBai2wFPxWaGYUsVMeLHxcWk/pz+AtMTwfE9J
	ZYzw==
MIME-Version: 1.0
X-Received: by 10.70.38.225 with SMTP id j1mr978381pdk.14.1431112329089; Fri,
	08 May 2015 12:12:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 8 May 2015 12:12:09 -0700 (PDT)
In-Reply-To: <CAJ86T=UDg+yZPgsuuNXqV0ZENMTAatbnx1qk1LxscwTfN0ndkg@mail.gmail.com>
References: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=UDg+yZPgsuuNXqV0ZENMTAatbnx1qk1LxscwTfN0ndkg@mail.gmail.com>
Date: Fri, 8 May 2015 16:12:09 -0300
X-Google-Sender-Auth: 0wgCzrRQj1ZmCSj0jmG9xYuFOEE
Message-ID: <CAP9ODKqyMGSov5FpbWkwN5cqVrHdCmP5ZeHB31+2Q6vhQB-YJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0: convert GSTREAMER_1_DEBUG to PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 19:12:08 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 8, 2015 at 4:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
...
> Or perhaps even use the "GSTREAMER_DEBUG" variable in gstreamer 1.x recipes?

I think the PACKAGECONFIG is a nice compromise as it allows for
granular control over what to enable or not. It is easy to enable it
for recipes in a local.conf using pn-<package>_append or similar.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

