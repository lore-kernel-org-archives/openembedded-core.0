Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE186A8E4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 19:08:11 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 4so1662370pdd.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=n2sa9BH4CAHThDroQoMQKcURIzguae4q/nAKnSRAUaA=;
	b=LVJOc32WzDbNbfVYuruoIh6refTEI5TRsUvFMHXKyKqXQl9SUSqFuIOfmDUJigs+8Y
	SRrP4fx8+fZgJFitGHAQDf/oZV7GT8dm5VJvme/rEaWobuRMRQ70jldqU7rt00Eedy48
	QX2ABlg8rp8AsvwReifQlzItaEk/5OaZ5wHuuAEtUVnL1pOqDQFC992+88rzC3mEJocA
	cJDvxCUIUKxNbnwY+ohiwb5Klxkb2V32Lg8cA5acl7tDG2V5HwAisrshPSlto5tbpLmf
	Zh4XEdL59A1BNCiTgjrwRX7fMlykWmFGPqQl74jr6SzcNCgxxCWgC1pMd3YK8LaArjBQ
	JF8w==
X-Received: by 10.66.231.103 with SMTP id tf7mr17191012pac.154.1372532892444; 
	Sat, 29 Jun 2013 12:08:12 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fp2sm13983779pbb.36.2013.06.29.12.08.11 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 12:08:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADV-EXHJWMyfKZtEkZ64svZ=yH7aX2U7afDgJBFefU68CVMaCQ@mail.gmail.com>
Date: Sat, 29 Jun 2013 12:08:10 -0700
Message-Id: <AF1FA948-0EE6-467A-901A-31CC86167144@gmail.com>
References: <CADV-EXHJWMyfKZtEkZ64svZ=yH7aX2U7afDgJBFefU68CVMaCQ@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Check if environment variable is empty
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
X-List-Received-Date: Sat, 29 Jun 2013 19:08:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit


On Jun 29, 2013, at 12:02 PM, Yevhen Kyriukha <kirgene@gmail.com> wrote:

> Hi!
> 
> How do I check if environment variable is empty or not in *.bbclass.
> 


bitbake -e <recipe>  | grep -e "^VARIABLE="
e.g.

bitbake -e gcc  | grep -e "^CFLAGS="

will show CFLAGS

might help


> Best regards,
> Yevhen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


