Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U64W2-0000Gs-25
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 20:30:58 +0100
Received: by mail-vb0-f50.google.com with SMTP id ft2so1689925vbb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 11:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qNwZqgCdU+vbvdYIEz8FlMRp5I2/dLLDAje8PFOmqbQ=;
	b=ZwIG8XmuXvtx0dQJc1DBRdbFNdE1mOZFJoGY7yKdzqpyNc7ChWCnzN3UT7WDWeI7lM
	qBr1ahbmpnB7Eix6W6RV/U/MRg1hP/Frppl8Y45QnYUOaz/OGubjrFepvVXmHmwDqdHU
	aOfbmB+o3Xm6eajueNV4KswEfyCZJCRPZdbV37UrDBbPwBdewAgRgjmtKfXQPR6zjpmV
	xW3Xm77zlZvjnqNQnw0ZJkp+xqtkhahRtiZPqp1/akhDxaL7rTAfzARI2UswU7ULYCCC
	QAwJYrLYlDua3A59HTxU+zCsl+/UhRdMXJBJqnCtBFjG7yLJeQHvRSC7a4ETiJ8KicD1
	sUAg==
X-Received: by 10.220.108.2 with SMTP id d2mr36991962vcp.60.1360869279154;
	Thu, 14 Feb 2013 11:14:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 11:14:19 -0800 (PST)
In-Reply-To: <20130214183114.GM3300@jama>
References: <cover.1360864224.git.ross.burton@intel.com>
	<b1c98f2ddb9165ae580daa42c509caca1fe7cdbc.1360864224.git.ross.burton@intel.com>
	<20130214183114.GM3300@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 19:14:19 +0000
Message-ID: <CAJTo0Lb-En4xj6DAJ+6RBz1YSxVo_JyWCEXsVzbqPpwuvTAoRQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQl+C7DIN+WloVDjyDwkjRL59TpwKYs5wQwotBZjDgxl/AYSVhs46s/RRIMe8++8SvcVP0F2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] package_ipk: check CONFFILES exist before adding them to metadata
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
X-List-Received-Date: Thu, 14 Feb 2013 19:30:58 -0000
Content-Type: text/plain; charset=UTF-8

On 14 February 2013 18:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> Shouldn't this show at least a warning about missing conffile?
>
> opkg-build error saved me few times before adding CONFFILES with wrong
> pattern not matching anything in FILES.

I'm pretty certain rpm doesn't produce a warning, so we'd want to fix
that up too.

Anyway, do we want to introduce warnings that by design will always
cause errors on a set of packages?

Ross


