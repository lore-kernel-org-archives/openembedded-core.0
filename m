Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCTeF-0002We-8B
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 12:33:40 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so848442vbn.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 03:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=QVAeVSsE7zgSb/8+iD7ZJuBnymG4ruMZWmOyddHAPKI=;
	b=Tq7iA0CXCGVcPnYJDEg8acAQyr1TaWY00RRtuGVRVwV8CM/ABQI4muMiDXm061yjLt
	6sG2cp1AlvluVR61Oo6CuujwmauEyw25RbtJ3KGQqGWWI2EHSTVnVhDrq2uDjSPXD1cx
	5X7AUQnG8pnnWxGfB6Gh5PR0gXLprvZlSaNlxWSuCB6L2obtGjysZYKzMiUpb9P2o0E/
	jNpQHGg3EGa0jJqnPora4blFIDl6zzknODd7gmNLW4h46hN/9CTg0VvYoJ+bv4Or1fgc
	YdGvGkJ4sTE3lw/2IihfdPCH14aCfICcsrTC0/xBLsufZJOAgwqLl85ej8bf/VtxJ3NL
	IK9w==
X-Received: by 10.52.21.212 with SMTP id x20mr6512628vde.106.1362395831249;
	Mon, 04 Mar 2013 03:17:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Mon, 4 Mar 2013 03:16:51 -0800 (PST)
In-Reply-To: <20130304111337.GG3268@jama>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
	<CA+chaQe3c3aYV6xEYsScoMWTMexe9rR4UiKCAszTjG-xrad59Q@mail.gmail.com>
	<1362394572.29587.10.camel@ted> <20130304111337.GG3268@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2013 11:16:51 +0000
Message-ID: <CAJTo0LZXb4v4vRo7somHNOnBJ506Oc5eHBMrWK=cRdYePq_xkg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmhg2/6VTh9gNAqO++BcL+FrCC5TyN8qaKp4HxyheGMLahwCz2IMdzjRBc1BejFMVYeu+Bq
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 11:33:41 -0000
Content-Type: text/plain; charset=UTF-8

On 4 March 2013 11:13, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I'm hoping we only have very small list of these problematic
>> dependencies. If we end up with a large number of them then yes, we'd
>> need to abstract it but I'd prefer to avoid that unless proven
>> necessary.
>>
>> Is there a specific case you have in mind?
>
> Isn't systemd-systemctl-native another candidate to be included?

Yes, it is.

Ross


