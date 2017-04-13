Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6BA72F05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 06:34:07 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id a103so69399177ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Yftpzt45C30u7n7/O+rpf3udaJAmDLMKQd1bO8lN1LI=;
	b=weIe6glYmdI4j7nrRCK+PbGqq9NW91WTKQuF35JKGUCnz96zWCJHle04VMsUXB2LS3
	CatYZO4famzc7tvJLQdT2rUWLE8/tx+zQQsSQ1yn1LbjKBv/fsh8HwozXg4CTrDh0ZeP
	sWA7zSnelEUN3+FY082QKgBH37nAX3OdmMxODSF2+VwzLO+a0gswJmOeEvsxm0sRQhEd
	JMnj8Wm+Y6gWufiqHZokbDgQBWVTuvFnd54e9pj6OePI3TlhCnM5j1pwWdAhcY++KZqn
	+ISHv69LnVwbCF3l7umSJP0KBeuRlV4LPYpCjOkPeNbuo1YKUfQnKeq5Sms73dcEnFPM
	0L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Yftpzt45C30u7n7/O+rpf3udaJAmDLMKQd1bO8lN1LI=;
	b=s6eYc5MOMzrlJMTWnN1ai2ANM9xrAYcjxYAT5ASgpzkXuuGUeGBLW7Mb8Nb5pid5dx
	dhxMaJE8OgttIIy1aGoRKN69xMqyuH4ip4k4HmVRcbJigCKGWnrCgLz36v6lykwIWQxL
	Rhomvm0nK9yaLp9mfnu/8bSpWhe4WNYeKZhC/vourp665nKjkeQ/U41/PWdG33GGvtBF
	p0Mj6lXwIduqjycL4LuxPLbttn+Vuswuuw8L2KO+Mja0JqqSWdOSFv1pwUeDVl/V+X0Q
	KWH0IL68zyt6vx+/nvNKuBxtcqZQVDdfu7ImaVJYl0xDLQlUGBzb17PEV4DSkWdOJf6a
	Jwfg==
X-Gm-Message-State: AN3rC/5VRoG7M8nbWU1LVFmQ+42csIUf8zUNY2V9x4RJRlrWGJLjcsNa
	79mMI0Zv/eECDWCa
X-Received: by 10.107.198.80 with SMTP id w77mr1704938iof.121.1492065248914;
	Wed, 12 Apr 2017 23:34:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C73A.dip0.t-ipconnect.de. [93.232.199.58])
	by smtp.gmail.com with ESMTPSA id
	g69sm3576920itg.17.2017.04.12.23.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 23:34:08 -0700 (PDT)
Message-ID: <1492065245.27604.45.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Date: Thu, 13 Apr 2017 08:34:05 +0200
In-Reply-To: <1492004877.5507.2.camel@ts.fujitsu.com>
References: <1492004877.5507.2.camel@ts.fujitsu.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using boost-program-options and native
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
X-List-Received-Date: Thu, 13 Apr 2017 06:34:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-04-12 at 13:47 +0000, thilo.cestonaro@ts.fujitsu.com wrote:
> Hey all!
> 
> I want to build a tool which makes use of boost-program-options lib. As long as I compile for the target, all is fine, but when I add
> > BBCLASSEXTEND += "native"
> to my recipe, I a bitbake error "Nothing Provides" ... :(
> 
> > ERROR: Required build target 'mytool-native' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['mytool-native', 'boost-program-options-native']
> 
> In the recipe I just depend on boost and RDEPEND on boost-program-options:
> > DEPENDS = "boost"
> > RDEPENDS_${PN} = "boost-program-options"
> 
> Is something wrong with this? Why is there a package
> boost-program-options but no boost-program-options-native, altough
> boost-native exists and the libboost-program-options.so is installed
> into the
> native sysroot. (I can compile flawlessly without the RDEPENDS line.)

Native and nativesdk flavors don't have packages, so RDEPENDS only works
when depending on ${PN}-native (but not for ${PN}-native-some-package). 

Try:

DEPENDS = "boost"
RDEPENDS_${PN}_class-target = "boost-program-options"

"boost" already is a dependency via DEPENDS, so you shouldn't need an
RDEPENDS for it in the native case.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




