Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 19E4B61AB1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 11:54:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r7so5410267wro.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=QL2oozk2/K3dXFl7G77pLtvelxUPuLzAOjw1EJwDjtY=;
	b=tZHJVmHCOeK8hA3OvjOcdiTsqr2kWsKlgCkgOWktEEv4/W2KGRKTypGUq/3Tn8OG51
	TYNstE1Uf7lKl6sh1XlWbPymHhPye7OA94ab09mKSxX2yZG3qd94T75RG3wzSlR6SnIn
	6ZtMJ74cZn9MZBTI5TinzehUkNvezWB5ORLzGSbkIKTEL8g9UPGtNttZfxttojbFpDCa
	sJag+BXU9bXjoW70FEmbe2GbhLFbKgQmgGcUGTQYaYaEWIPizMipCfWk4cPGGDZUleGl
	wGPrFXMDOIJMeK5DcNR0ftszJi1FuMm8auntwG02VQbAjW8ySg9EcvdNYH+za8Ntm+q9
	eUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=QL2oozk2/K3dXFl7G77pLtvelxUPuLzAOjw1EJwDjtY=;
	b=sWaVrQojJYH1P4PkvpDyAKXEAwnLcAb1YjrBW8JltP2X8irmtfZzHApeUXhGSORcpi
	mNCpGQpjbgRkSUfl/tRbWsW/xJgFA1YjsVIsrdqD42OstebTm8lymmaDgZuS5OeBkBXW
	JKu7nbh1DRYVgH3snmYGjjytZoOh7Qj9gbjP4uGe2gcffSfk8Mz4mm5sSKa0qQu4oWIa
	u9H8Qlg/hHjtDhtLpJEETpLOyqD8Bg8tk+tted9ceFSQI8vPP4Jn186sJC8bc4+brnA3
	YHDDb3Qba9t+WLnN1Y1MBEoWgyh5G+hnY0grsyEXoWr3gQ+rWcwtxXDAsEb5qdtjLu0Y
	V9/Q==
X-Gm-Message-State: ANhLgQ2+9n8+aaSPmrJbjZ3iY9OSeGuuEYeiis94xmHgGlpHskYjQRo5
	2x4+9kyhxegfLlUuygdguK0=
X-Google-Smtp-Source: ADFU+vsCH0+L0/nPaUh1UDD1Us9e7JdvgyPWJfuewM4h2WDhXwDVb6EcJBJEbDZQIBOrZ8BKp18Jfw==
X-Received: by 2002:a05:6000:1186:: with SMTP id
	g6mr9364430wrx.331.1583582089397; 
	Sat, 07 Mar 2020 03:54:49 -0800 (PST)
Received: from md2pfrec.lan.ffah.ch (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69])
	by smtp.gmail.com with ESMTPSA id n1sm6885759wrj.77.2020.03.07.03.54.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 03:54:48 -0800 (PST)
Message-ID: <b73e07036162eab111213d9d3bd14c7436733039.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: richard.purdie@linuxfoundation.org
Date: Sat, 07 Mar 2020 12:54:46 +0100
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Sat, 07 Mar 2020 11:54:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Richard,

We have found two already supported ways to copy variables from the
bitbake environment local.conf to the eSDK local.conf

If a variable is defined in the local.conf bitbake environment,
SDK_LOCAL_CONF_WHITELIST and SDK_LOCAL_CONF_BLACKLIST can be used to
add it to the local.conf eSDK file.

If a variable should be statically defined for the eSDK but not for the
bitbake environment, sdk-extra.conf is useful.

Now we would like to add a third way to add variables which are
dynamically calculated by bitbake but need to be statically added to
the eSDK local.conf. For example we would like to support something
like that:

def get_version_from_git(d):
    version = d.getVar("GIT_VERSION", True)
    if version:
        return version                    # runs in eSDK
    else:
        return bb.process.run("git...     # runs in bitbake

GIT_VERSION := "${@get_version_from_git(d)}"

SDK_LOCAL_CONF_EXTRALIST_append = " GIT_VERSION"

Regards,
Adrian



