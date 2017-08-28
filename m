Return-Path: <prvs=0413cb8a74=mike.looijmans@topicproducts.com>
X-Greylist: delayed 5429 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Aug 2017 13:27:02 UTC
Received: from mx6-05.smtp.antispamcloud.com (mx6-05.smtp.antispamcloud.com
	[95.211.2.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9B076FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 13:27:02 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx16.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dmGf2-0003Pk-MQ for openembedded-core@lists.openembedded.org;
	Mon, 28 Aug 2017 11:48:50 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 28 Aug 2017 11:48:44 +0200
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <2f23d33c-6c32-d71e-d663-f1ddf9a3325f@topic.nl>
Date: Mon, 28 Aug 2017 11:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.25)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzbZEnduKe3Yh7YgqyC+oxxLOd/kpDo5MZ+2OzMc/i++2kHGIaBQfUy3wSMn
	xaMkhGM8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9GwS0RTbIegwn2yn+XE4z9zMbAT/bTGM3eqpSRQBxZnohU6Bcmhx5
	s+FDVmlf32CllP5nCit4gYqKGJGRNdpE77YZQGxcFxcrkq+IKIlinlm7VgW9/bktU41htiJ8fk7N
	kPOW6bvL9DC431WlF1LxckxMBAJkcsAhDD4OTTRkzMU8KuR9h4rJ1IhRjQc5xQiShMsl1/Uwzz5W
	f47cb36AX1RFRFR4qXE7Cn+3zlGq5KdMkPSFwiQJ3tFtiHogYsQlh3McN6qoXPjenLhIOF1oeRal
	qoUFcqqewmWkKz3eG7B+eXFW6YIKNkBKq4p3jh6digwGgu0I3L9ME42qjSBuyyIXxtfcMda4cwZ8
	rh64tcarXOWTNe7V3DRZwGi/g5L8wA/x3X0BF7Fa0YjOTdIZowOYKBooIIeAsENqHR9V+xuiV3+k
	HKBAAleVXVKtuZ5b5/tbn20F5iKif78yCULYMH2vQbJtWC5MSfAF0WrPxMFtilVH+JEwZkFSDfbk
	1hJtvw==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Request for pyro: rootfs-postcommands.bbclass: Prevent linking testdata to itself
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
X-List-Received-Date: Mon, 28 Aug 2017 13:27:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI noticed this patch made it to master. Could it be applied to "py=
ro" branch=20
please? It's really causing headaches there and there's no "bbclassappend" =
to=20
workaround the issue.



commit b516394f9e7858062aa7b042aa4a1bdef9d3a941
Author: Mike Looijmans <mike.looijmans@topic.nl>
Date:   Thu Aug 17 12:49:49 2017 +0200

     rootfs-postcommands.bbclass: Prevent linking testdata to itself

     testdata and testdata_link may point to the same file, in particular
     when IMAGE_LINK_NAME and IMAGE_NAME are equal.

     Check if this is the case before creating a symlink that points to
     itself and makes the next build fail.

     Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




