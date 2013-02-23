Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U9AoE-0003qN-Tx
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Feb 2013 09:50:19 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so1170724wey.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2013 00:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:cc:message-id:in-reply-to:references
	:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=VMlVQlKSwZ4AjwOvA6TasLQSiSDjEssddSSYbsjNqoY=;
	b=SXj9Dnc1O++iK08kKEE2vKhG591GhYj9ifaFyx1pfzwAQ/vlgeqEeNcQbur7pc522C
	yPxo66upjgRltR6AdbyfyFnWuSG0Z4IoZUrz5sVUTwprEd111OIQdJa6stplvSsyLtJV
	fuksUU0OoVf6ejc4V9VPLPcilgBGIjsy8DNV53Ytub0uwXcbxVMjyChWOb6SUQPShg8S
	Ay1xMWW3NDgsREAf4HyKcFJnLgDnv29B5NMyyEML/8Lo2J/KrOC7J4wBu1pH0M3mHjgX
	7Gz4IUFx9psuHjxDdLS9+tPzok3eljqBmi4MPEdmFLGm9is4wMKW0QAL9ul847hLuJ9h
	0KtA==
X-Received: by 10.180.109.82 with SMTP id hq18mr1864776wib.0.1361608444168;
	Sat, 23 Feb 2013 00:34:04 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ek4sm2311274wib.11.2013.02.23.00.34.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 23 Feb 2013 00:34:03 -0800 (PST)
Date: Sat, 23 Feb 2013 08:34:08 +0000
From: Ross Burton <ross.burton@intel.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
In-Reply-To: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlaMkgmWRolGxFWbLSXt+aBmnPKqN9w3WgfS0DXXWbZ8MLsgsiaTBpINVY7oAXhX9S8HpNp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: enable connman client
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
X-List-Received-Date: Sat, 23 Feb 2013 08:50:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Cristian,

On Friday, 22 February 2013 at 20:10, Cristian Iorga wrote: 
> - --disable-client \

I'd prefer to see an explicit --enable-client here to make it clear what we're turning on and off.
 
> + install -m 0755 ${S}/client/connmanctl ${D}${bindir}

${S} (source) should be ${B} (build), although at the moment they are the same directory I've been slowly working on changing that.

Also the fact that you have to do this is depressing.  I wonder why upstream doesn't want to install any of the tools?

Ross 




