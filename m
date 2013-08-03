Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id D3C90608BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 17:53:43 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id dn14so3064430obc.26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=inl8fKXZM6HHfb9zzMlp3ssTqJmKSobQ0byQ92jSX7M=;
	b=plQ8tA0czEV7OYn0cQvqoOSKO6EwtyVQsuCLn3crXr/XinNrtJIge4VnxltFmS42+3
	UyDXP22nibb16mRDdxnvZj4iftqguLRoEeAk3g04okd9ryBDJ4w58jcUGxrEPleBZe4T
	b/PjxC7jVdO97w1UKCn7bqLEK0S7vWFqwU4Y8w9WjM7T9Gxvarn5dUaFVYrROwd8KEG8
	FYYuEVm3MQLlTO0JTIeXK7QsukVM5Kza47y7OAo35Zx7l0e6pAbivyRxYrwl0JMM1NB9
	BhJIQ9fV+9Y78iP5UXKc/rM8+wJK3aVq3/OyHWGYICCMbUTXw0v8QwMdwCqQ1wzyciek
	/OSw==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr9205239oeb.57.1375552424447;
	Sat, 03 Aug 2013 10:53:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 3 Aug 2013 10:53:44 -0700 (PDT)
In-Reply-To: <1375521469-1654-1-git-send-email-lpapp@kde.org>
References: <1375521469-1654-1-git-send-email-lpapp@kde.org>
Date: Sat, 3 Aug 2013 14:53:44 -0300
X-Google-Sender-Auth: XQHDHWWVSdDgC4mBx4DNbSTaCYY
Message-ID: <CAP9ODKrGeOrWx6v_E9cYBY_VvBn3BLNDWMaDBekhfFR3sr4+eg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Sat, 03 Aug 2013 17:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 3, 2013 at 6:17 AM, Laszlo Papp <lpapp@kde.org> wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>

Please reword the commit. You're not updating it but adding 2013.07 version.

Personally I'd prefer to update for 2013.07 and drop previous
releases. To support the update, I've been using this in meta-fsl-arm
since rc1 ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

