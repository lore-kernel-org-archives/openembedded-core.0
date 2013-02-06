Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U3bW2-0006oB-7x
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 01:08:30 +0100
Received: by mail-oa0-f50.google.com with SMTP id l20so3468632oag.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 15:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=H2z7qR9N/sEQxIF4rUoox24bnOV6gNUQXmBCLznXoAo=;
	b=ft4snB3307ydOxwGDzksM0qrPlABNTn0jVpH6JBoDG/BoQ84JGn636jA1OcAYkJ1TI
	QTjx/eDelCkigJd+GKyPXeG6zxlUqPZhzt1AkYa3+mL/pX5WqmPlJfEpo8lXBBF6Y+h1
	Sknd1MulIvCY9xD7rHD5C0tNTqhBpw1rquqiml4WvITdj8BjO+fczc9/tbkyHxXimuqM
	X/SMKWeHYlODKigcrDNM3i2DdMYL1E2tYn1qVVoq1vWT3OwTSjeCtMDC/Ux+dTAODcDJ
	goG9EWy0WnXp0Sjc3kT97BYGZO4NdYfUoOBvCE2b8Y22eD1gDIBcq3qAAcFqC4wNsyPj
	Bj5g==
X-Received: by 10.182.88.3 with SMTP id bc3mr22298355obb.8.1360189323104;
	Wed, 06 Feb 2013 14:22:03 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id ee14sm31041632obb.2.2013.02.06.14.22.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 14:22:02 -0800 (PST)
Message-ID: <5112D7D3.6020304@felipetonello.com>
Date: Wed, 06 Feb 2013 14:23:15 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<51115E97.1080404@linux.intel.com>
	<511182A9.2060702@felipetonello.com>
	<0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
In-Reply-To: <0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
X-Gm-Message-State: ALoCoQmjbhnIeEyhGqYbszQ4z7y5PsfN2eRcSVZeXc06s608rsb5wbD7scZvTDqgoNvatgD+g2a9
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Fri, 08 Feb 2013 00:08:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2013 02:58 PM, Ross Burton wrote:
> On Tuesday, 5 February 2013 at 22:07, Felipe Ferreri Tonello wrote:
>> I chose this path because there is also a front-end library for connman
>> for gnome in the same directory.
>
> It's not a library, it's a UI.  To be honest, I'd happily see it move to recipes-gnome and connman-qt be in recipes-qt.
>

So what was decided? Should I re-send the patch with what path?

Regards,
Felipe Tonello


