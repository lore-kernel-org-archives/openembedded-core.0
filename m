Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1656FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 12:34:31 +0000 (UTC)
Received: by pabur14 with SMTP id ur14so65325539pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 04:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=sVF7lTGYhMbVjeTbzoJL8JH6V/6p1kudtVYIO/Sc/Ac=;
	b=MKm8yEgp9bfETD8rnM6YfSLNuJaqNNw8tHKqZ3maTMPo7ehfjLauaWNNovY0koqahq
	VA9Ck0e0H2c3eOSdR4y53ELhDWO57J+QMSpmeHzfCXbqyvbzLXzVLeAKFRuRQqHCLLA+
	qoPTpm6uoXosscXLG7DM1lXsbMaCjvYwWUFhvMkN7pQbM6ArV5dhcMLefITbGDy+hdhz
	XN+ssB6syy2hSjrNBWmH8/Xc1dbYGUusQJqfqs8/alx2lBWLLvgIsVZtpUv0uXe4ChUr
	beK7qtgzzDw6CR5KqOpbUm3hXeYTKla+XEOBktAavRKMZBaVgQQgBnsOCcq9EqzKdvrg
	x8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=sVF7lTGYhMbVjeTbzoJL8JH6V/6p1kudtVYIO/Sc/Ac=;
	b=m/fwzlj+vI1daGo6hN15kDXDHslLinh1EYY8etLa+U/kBacRFRg57/11vFaPFH9piT
	7MXEPqXKn+XwCcMn5rviuGLNWYE9L7yHz0GNBhzjwyXceEAcqUCSGwbFi/ndFSTot5X+
	13i0p6mw0aMhen/djhLXzbgN/QfkHGvKdZIIB74H0dhiXTVc5tTKoMaMN9VUmV3mLABi
	z95iXcuCzKkDt5BMjLadzisAMw5QvaRbRp9V/BobH48xFXlLxu6pVcD17XvNplabFQ58
	OO2oZ5nVIIEaCquMaqY9kpYfOPNkCbekgjohLVsLh5Xd3Mu80RQIymks1TsyGYD7efTU
	eWtg==
X-Gm-Message-State: ALoCoQkE1vQPMocyvPLechO5oD2KA9OS231OXssDtjyChC3j4C4FT1kEYqWLsmaMHk1PLdGekpm85HiXZiAaibBCkJjxWIhd9g==
X-Received: by 10.67.3.196 with SMTP id by4mr24361687pad.67.1449837271877;
	Fri, 11 Dec 2015 04:34:31 -0800 (PST)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	p26sm25027382pfi.94.2015.12.11.04.34.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 04:34:30 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabur14 with SMTP id ur14so65325231pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 04:34:30 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.119.136 with SMTP id ku8mr24895003pab.128.1449837270393; 
	Fri, 11 Dec 2015 04:34:30 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 11 Dec 2015 04:34:30 -0800 (PST)
In-Reply-To: <566AC1B4.9050508@linux.intel.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
	<60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
	<BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
	<CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
	<56659548.8090509@linux.intel.com>
	<BN3PR03MB1415A9FC4E4B3D1B7773F618E8E90@BN3PR03MB1415.namprd03.prod.outlook.com>
	<566AC1B4.9050508@linux.intel.com>
Date: Fri, 11 Dec 2015 10:34:30 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpmpyjZTN6KSKOMebR+_wjNwEAwaFL1gXF9uqkmNCb3Qg@mail.gmail.com>
Message-ID: <CAP9ODKpmpyjZTN6KSKOMebR+_wjNwEAwaFL1gXF9uqkmNCb3Qg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Fri, 11 Dec 2015 12:34:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 11, 2015 at 10:29 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 12/11/2015 01:44 AM, Tom Hochstein wrote:
>
>>          # There are multiple ways to start weston.
>>          if [ "$WAYLAND_DISPLAY" ]; then
>>              echo -e "\aError: Weston is already running."
>>              echo "This script does not support launching Weston nested."
>>              exit 1
>>          else if [ "$DISPLAY" ]; then
>>              echo "Launching Weston with the x11 backend"
>>              openvt -s weston -- --log=/var/log/weston.log $OPTARGS
>>          else
>>              echo "Launching Weston with the DRM backend"
>>              export XDG_CONFIG_HOME=/etc
>>              openvt -v -- weston-launch -- --log=/var/log/weston.log
>> $OPTARGS
>>          fi
>>
>> I still need to test this (and apply the design in systemd), but I wanted
>> your feedback on the approach.
>
>
> I think this looks okay, but you obviously need to test that all three
> scenarios works as expected. Also, systemd unit file language may not
> support this logic (it's not a full programming language), so the above
> snippet probably needs to be separated into a wrapper script.

Agreed; the wrapper might make easier to integrate it on both, with less work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

