Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UV3Hr-0008MZ-Vr
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 19:15:23 +0200
Received: by mail-ob0-f169.google.com with SMTP id tb18so1737732obb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=QktWVwXjwiJwn0zcYDeQuKZTk/jrK589DxKGoyPLUHk=;
	b=hLyZIIdBifzzUCParjhsaHXXC4WbmCfNjNvZp7TOE73vSkHdC/NUf4GGE6V23eYOuk
	y09Q5GBIxus/hHeezPpM0vhggtyHWbVzy//lkCHQoCoqOHCMb1zVaHCBwHXtdVbQd+G3
	kme7jpIz6biDc55Fv43YXBnPY48EcNCHKCAefUij5vw1S794tN+8YFJP9x4pzgfDTqNj
	cX9eBDGt9efFgnBYPIKLdDCBhGnoShX+toF+JIkk7sko3v673bC2FF0ejE7rlBhwr65A
	/PNDAbGD+EGxt43zmUw1mEJXL9g0tjq+0+gCePbsIA8cxvdbYnv192qZIFcMjvzSlL6B
	XTaA==
MIME-Version: 1.0
X-Received: by 10.60.135.103 with SMTP id pr7mr13982935oeb.142.1366822657308; 
	Wed, 24 Apr 2013 09:57:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 24 Apr 2013 09:57:36 -0700 (PDT)
In-Reply-To: <1366820905.23738.153.camel@ted>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
	<1366820905.23738.153.camel@ted>
Date: Wed, 24 Apr 2013 13:57:36 -0300
X-Google-Sender-Auth: rRZP5tAXDPCnrVlcFVhXWaf8OjQ
Message-ID: <CAP9ODKpzSHzVsf=qmaPvL0RVXCSrHVmrPcxG7TKrCH84r=T=OA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
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
X-List-Received-Date: Wed, 24 Apr 2013 17:15:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 24, 2013 at 1:28 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-04-24 at 16:58 +0100, Lewis, Nick wrote:
>> I am seeing problems when using PACKAGE_CLASSES = "package_tar"
>>
>> There are many warnings about python indents and there are errors
>> regarding missing populate_sdk_tar.bbclass and rootfs_tar.bbclass
>
> With 1.3 (danny)? These should be fixed in 1.4 (dyland) and master...

^ dylan  I guess ;)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


