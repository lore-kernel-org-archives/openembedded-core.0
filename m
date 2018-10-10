Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0682B60237
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:57:58 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id e17-v6so3455436oig.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=LDHpa12D9mvGk774JIE1mMvcFzz3TCzHI4dFeGDWY3w=;
	b=LULGeWnIvZ0nhYZ71H3k3jRHMsMnlSWZOMKLyzFkin2iH6zJNU/KWlDOLY5NMIiU0x
	owpR74MqZaWD5jg4aEpCRwnUfzOKLafF9Q/DFNDD5sQhB9sBkTSL7rQToJzkSOJrGGTD
	mDEAQsuKJwsQw4wnzu1GbMO1oQADzo/oVLLrT+lFkztcYtFXDsIrF6ITUco8A7psiL/V
	1Qqdb/1Lzv0pl4j1OoRZhUrBocZa95fT+f0Ih9a1uR8oA1cn8+xHuM7IEQYeqp9emFHW
	DmV6QtnRpzoJccOwGmKR8Nyfg688lwFJVk3TUZNXwRKMrx66VKIFBg0ZyacqDjxEewwh
	3QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=LDHpa12D9mvGk774JIE1mMvcFzz3TCzHI4dFeGDWY3w=;
	b=qZINENYKrqODbSlhI7E3tIHKfkALf6c2GfWoKrwyQjrZnt9XfMBwxASlKzVPfp+QVN
	QyLn+lzR8yJLL+rnReE0pGQnipelzvpbf35CTWVPPRRB1Zsjq19USo3N7641Vdl3N6H3
	uTksOakXCyC/bNF/VhCVPg1CKtrmZHK47orTOJ2QhikwYYfwWUuyT6HbAMSS97KsDb6/
	UoyM96YUP/Gnh8kfa3AAKIuy1mS8zVXGdSv9EaFR1z+bJO0uc31vYAC2EwCGYU7Il8oV
	ewQSdtl9JrnZpvTX0hJefJe/iqPFdh6MVDWoCAZSKbXEL2I9FJFM+LEZDzrQMGDmh/Jx
	TjdQ==
X-Gm-Message-State: ABuFfoiUQF4q5nsBzoLrQX3Z6xBgdsRLKc7IYBdSKlS9m9xudix7uUkJ
	wWIgYqSK8OLzC8zuvWef4dM3cfG3h5DcOUmUv8SHDA==
X-Google-Smtp-Source: ACcGV60zrD8aC63wqTjM0B85uF/teKBg0mIo2GlPS27F2fnWF8KzUF76i9jTPS4S/bB5S6aAv3YXMYjL9YXzQqMTkq0=
X-Received: by 2002:aca:c54f:: with SMTP id
	v76-v6mr1161991oif.276.1539161879565; 
	Wed, 10 Oct 2018 01:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180927190648.27553-1-schnitzeltony@gmail.com>
In-Reply-To: <20180927190648.27553-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 10 Oct 2018 10:57:47 +0200
Message-ID: <CALbNGRQ8qkKnUz+BsPD9ReuEzYzLX4ni7cr70bFQpL3Uv0UNxg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [sumo][PATCH] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Wed, 10 Oct 2018 08:57:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2018 at 9:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> The patch should increase performance for libsdl2 on GLES2 too.
>
> (From OE-Core rev: 52f9659f2bb44affec2f67935df01f13b6ff3e02)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
ping

