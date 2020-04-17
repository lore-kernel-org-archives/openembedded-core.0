Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7994.1587124189010580581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 04:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YoZoTi10;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=982; q=dns/txt; s=axis-central1;
  t=1587124189; x=1618660189;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2lqO3dOXugJXKyycO/yovbnSF13D5Qy+4ndeoFxZiJ0=;
  b=YoZoTi10s8F45w1nE45BJ4i+2RQB0qyUDRgICRB4ywm6bwdZJ6vlrYxP
   3nDAndLc6+pB+O5efI+IL3oCuu1qIafxm2wjFgUaWOsYOGI6Pm+LPNYHw
   9WZoU0h+018RHMu2CjRQXqHl0N5THG72Oh4h6/B8A+cLw9opk/TsFGLj4
   DkMuSzPyZ4O5VJVXMHzHejWiBJPXOjL+g41OYZ1zl+vK6CxuN0lWgrfAS
   57aZR5hUidChw89V6lA+5kIUdd+Qmx/xGnugBpJ4MidFU+mAo8uYaVsoc
   ehXhMsOIKA19VOcAFsHfIvnmqLAQE6UzonyECrc1FnA9d3kuCT3E34rjS
   Q==;
IronPort-SDR: haxnuGm4a05pwC+BhJLGGtTzg4EHAxa5rZxD6rR82Jx0hYUNYhx4u262/xIQ5lZBxWso39ev2i
 moJg0q0pH+Fd9fpGfpUm0zvpHU0Z44WBYIAkiU55ncZYztxlIYcflhLuMUPhupHTrQnTwwqQxj
 5rvxl9TjxRD0oFmIivHjFWnRaLPf8DDQ8ubvhBQGIIXfJc5B+rhAVsq9PSBHaq2ePwBhwYNLxe
 ce9PKzXzF4lwQXhlvFvEIPR6N8quKOFIrtyvQbVuHq3STcBQxh38N6UtxZoqRxaoHIpogut3ir
 KEA=
X-IronPort-AV: E=Sophos;i="5.72,394,1580770800"; 
   d="scan'208";a="7742661"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>, Alex Kiernan
	<alex.kiernan@gmail.com>, Jonas Bonn <jonas@norrbonn.se>
Subject: Creation of /etc/machine-id
Thread-Topic: Creation of /etc/machine-id
Thread-Index: AdYUrXnyQumZvpsXSv2HdbkxSz6DPg==
Date: Fri, 17 Apr 2020 11:49:47 +0000
Message-ID: <1ae8755c596f479892ff0795d3fc869d@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In May last year, two changes were integrated related to how=20
/etc/machine-id is created. The first [1] moved the creation=20
from the systemd recipe to rootfs-postcommands.bbclass. The=20
second [2] introduced creation of it via image.bbclass and=20
systemd-systemctl-native unless the stateless-rootfs distro=20
feature is set.

When I look at these changes, I get the feeling that the=20
second will never have any impact since the first will always=20
create the /etc/machine-id file for all images (as long as=20
systemd is enabled).

Should the creation of /etc/machine-id be removed from=20
rootfs-postcommands.bbclass so that it is only created in=20
image.bbclass where there is extra logic to handle the=20
stateless case?

//Peter

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D76444b63e61=
4baea33c044851a5859f6d1e69729
[2] https://git.openembedded.org/openembedded-core/commit/?id=3Dc5fb399f589=
4c16cf8eeadd507dc38c29b0fd657

