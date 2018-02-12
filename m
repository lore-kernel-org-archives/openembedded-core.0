Return-Path: <robert_joslyn@selinc.com>
Received: from scamp.selinc.com (scamp.selinc.com [74.117.214.142])
	by mail.openembedded.org (Postfix) with ESMTP id 77E4C7828D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 21:09:07 +0000 (UTC)
Received: from pps.filterd (scamp.selinc.com [127.0.0.1])
	by scamp.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w1CL6rP7022948
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 13:09:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=to : subject :
	message-id : from : date : content-type : content-transfer-encoding :
	mime-version; s=SELinc2017;
	bh=Xgin2UVLTbCv9W88974jiTpK19FwByrjRyODFdqy5jc=;
	b=g+ftBo+wQXGRA0O9QlUUxjCLt2EXDoNfquDR8oLpSfHfHFTUgigjsS1NPdAmu7pwSvfi
	GFZ7j0CNI3W+Bw+RGPtgb7sRe+pLNFgjZxcnmD4zxabc00j9/JyDoNjrGgMdAQmuv5QS
	eHQk4tyYvqFV5c6dEjLuC6ovU5UoNQtXBHLJDFHyY0Dt3VXVaTz5zMCLp2wWaZ29F4RY
	EhzOK3ZhnNDDEHpDqDfq7oSO3wMmKKAwjEPk/rAGXYOdm63QpqbZCXa11nqqqIhT7JuO
	im2idH7hQSKnQ4csWadH8EKizJbdxNxltVtkbKY7W3/5IyFa7QOIVzJqa1VyUL+u+g45
	PQ== 
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by scamp.selinc.com with ESMTP id 2g1yk33bt6-1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 13:09:08 -0800
To: openembedded-core@lists.openembedded.org
X-KeepSent: DC897003:15BD668A-88258232:006ED4D2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
From: robert_joslyn@selinc.com
Date: Mon, 12 Feb 2018 13:08:30 -0800
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/12/2018 01:08:29 PM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/12/2018 01:08:29 PM,
	Serialize complete at 02/12/2018 01:08:29 PM,
	S/MIME Sign failed at 02/12/2018 01:08:29 PM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/12/2018 01:09:08 PM,
	Serialize complete at 02/12/2018 01:09:08 PM
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8803
	signatures=668668
Subject: Backport OpenSSL 1.0.2n
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
X-List-Received-Date: Mon, 12 Feb 2018 21:09:07 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

I'm working with the pyro release, and noticed that it's still using=20
openssl 1.0.2k. The latest version in the 1.0.2 series is 1.0.2n, which is=
=20
already available on master. Is there a reason that the newer version=20
hasn't made it back to pyro (or rocko, which is on 1.0.2m)? I know new=20
package versions are not normally backported, but looking at the change=20
log, I only see one change mentioned that is not a CVE fix (the 1.0.2l=20
release):

https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openssl.org_-3Fp=
-3Dopenssl.git-3Ba-3Dblob-3Bf-3DCHANGES-3Bh-3Df2fc31a25c54b12fc7db40c03d39f=
9a68b9ec0e5-3Bhb-3De5bba24cd8bb3e5127a578b85c6edf013a38ea6d&d=3DDwIBAg&c=3D=
zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoFenj=
TGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3D3JjPoO2FeIBSz3wggiqKGtYceKB5t__oS=
e8p6yDsQfM&s=3DoeCHfmZkkXVFW1aoMZsolXeFvKI9RTUtbdGBj61kheQ&e=3D

I can send patches to bring 1.0.2n to rocko and pyro if they will be=20
accepted.

Thanks,
Robert

