Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1UQSSm-0003l4-5u
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 03:07:41 +0200
Received: by mail-pa0-f41.google.com with SMTP id kx1so1183469pab.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 17:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:organization:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=5YUMv6c1f54d9lN3WyziW0B+lIlxvDibrwcroE0xv8Y=;
	b=Yu2qRrThm7tO5jPqTw3RiL7QEQuj6tZ/0BlwszgNxE3cU0+SY8TNMcw+ln5eWgJUfg
	y7qAFJaroGUk8/dJ+Tz5Y6H6K4WhG6IFUqT1nH7wQ/uaU8pfwPTXmLDq7uhmkX6lLKWg
	NP2aj4bCsZx2jQbpcHLyUDJ02ShmHY1tJlymQi6EDAkHHkc00zHlXQvnmskx1T/Fhdc6
	OZH+n6TRofvt/Jodgq0u5UliVCvQJiX4DXFxNgbglNH7yPQf85CnfbGcTF4+eYhy7QS3
	upkkblwI4HhvImw5v3KReQ8Gu/EJZBVn9veTu9hDbgd1wOuO3V6oIIMrWOLTibPXf72y
	AMHQ==
X-Received: by 10.68.105.193 with SMTP id go1mr12058277pbb.13.1365727810382;
	Thu, 11 Apr 2013 17:50:10 -0700 (PDT)
Received: from [172.31.2.29] (wsip-24-120-36-131.lv.lv.cox.net.
	[24.120.36.131])
	by mx.google.com with ESMTPS id ad7sm6138825pbd.14.2013.04.11.17.50.09
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 17:50:09 -0700 (PDT)
Message-ID: <51675A40.6080600@intel.com>
Date: Thu, 11 Apr 2013 17:50:08 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQllP+oC3PgUkqhKhlqrNR8JMekgMaTqxfyF8lVHe/edOUdxd5oFOHG21tlYwgBuWKHhiJfQ
Subject: Master under test with gcc-4.8
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
X-List-Received-Date: Fri, 12 Apr 2013 01:07:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Khem,

Just an FYI, I am firing the autobuilder tonight with Master_Under_Test 
(MUT) with your latest GCC-4.8 recipe enabled, so we can get an across 
the board look at what's happening.

I have seen a couple of failures with an initial build in xmodmap and 
matchbox-panel (when building a sato image for x86).

Just wanted you to keep your eye on the build, I will send you any failures.

Thanks for looking after the toolchain!

Sau!


