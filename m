Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 83A346D726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:18:28 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id gq1so7025957obb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 18:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AuEF7k+fkN/7USxH2q+jyQNK3b/gkhrt9q0N65zmgF8=;
	b=ug1UdEQGa/2UOR72juay8XYG9frwvJ9qw7mt6wWYK5xbKEpZO/E0P+SRqwfI1u8Kgf
	68Xaby8HxGtjb6YGJenmyQAgGjFa8PsS6LrCnq4zoP2kxe8nzlIahk/nqQ03PwKtVTCG
	Pnrl/meAathBjH+Uei9ljJD1NgsKHkmukY43fqiaFBL9QtOiGs0ouELcNdkUWL+FvJHi
	3yw9sJNonS0vEq9cpnw4fLg3/JYIwVttR6AtPD6InvYNpZipoWkfuzszrMGXnxJZwSBG
	VwreMHQHXeT/t65UmVSLdKZ1KESMuiRyZskdAGDjpC1tTwE3yThx33M3lO4jiKY8VksJ
	lhcA==
MIME-Version: 1.0
X-Received: by 10.182.142.37 with SMTP id rt5mr9790824obb.76.1384309109955;
	Tue, 12 Nov 2013 18:18:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 12 Nov 2013 18:18:29 -0800 (PST)
In-Reply-To: <5282DDDB.4030709@windriver.com>
References: <1384244230-30541-1-git-send-email-ming.liu@windriver.com>
	<CADkTA4OqaxJyRp-T298LG-Jm36tUNkZXvKawoWGtKOCETARTvA@mail.gmail.com>
	<5282DDDB.4030709@windriver.com>
Date: Wed, 13 Nov 2013 00:18:29 -0200
X-Google-Sender-Auth: f2sacb8_-T5A2Z4yCrVWBTFLqx8
Message-ID: <CAP9ODKqWs2rp9q9uDOEXeQ0S67VeXgrAK9aCNa+h7c=uwH4wvg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: handles symbolic KERNEL_OUTPUT in bundle_initramfs task
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
X-List-Received-Date: Wed, 13 Nov 2013 02:18:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 12:03 AM, Ming Liu <ming.liu@windriver.com> wrote:
...
> So, I will put it into another commit, I will send the V1 soon including all
> the changes discussed above.

v2 ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

