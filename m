Return-Path: <konstantin.shemyak@ge.com>
X-Greylist: delayed 9455 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Aug 2018 13:46:11 UTC
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id C797779174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 13:46:11 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.16.0.22/8.16.0.22) with SMTP id
	w7FB8HP5048558 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 07:08:37 -0400
Date: Wed, 15 Aug 2018 14:08:17 +0300
From: Konstantin Shemyak <konstantin.shemyak@ge.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20180815110817.GA71089@builder0.em.health.ge.com>
References: <1534326204-395700-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1534326204-395700-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [3.159.212.191]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-15_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1807170000
	definitions=main-1808150122
Subject: Re: [PATCH] unzip: fix CVE-2018-1000035
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
X-List-Received-Date: Wed, 15 Aug 2018 13:46:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15.8.2018 12:43 changqing.li@windriver.com wrote:

[...]
> +++
> b/meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch
> @@ -0,0 +1,46 @@
> +From 349f566e6e757458843fa164a0f0584280e1501e Mon Sep 17 00:00:00
> 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 15 Aug 2018 16:20:53 +0800
> +Subject: [PATCH] unzip: fix CVE-2018-1000035
> +
> +Upstream-Status: Backport
> +
> +backport from unzip6.10c23
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---

Would you please add a line:

CVE: CVE-2018-1000035

somewhere after "Upstream-Status:" to let the automatic CVE checker
detect that this patch solves this particular CVE.

Konstantin Shemyak.

