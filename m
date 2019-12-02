Return-Path: <jrey@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id D9A4B7EC95
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:16:45 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xB2FFGZH027024 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2019 10:16:46 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
	[169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6rq9ag1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 10:16:46 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	xB2FEsSM032351 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2019 15:16:45 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
	(b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma05wdc.us.ibm.com with ESMTP id 2wkg26ukfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 15:16:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
	(b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id xB2FGi4650659758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2019 15:16:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C42C3BE04F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:16:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D426BE054
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:16:44 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:16:44 +0000 (GMT)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3a059efa-a5eb-41a5-2711-8e2687319841@linux.ibm.com>
Date: Mon, 2 Dec 2019 09:16:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-12-02_02:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	suspectscore=0 adultscore=0
	spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=950
	lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1912020137
Subject: Please review dropbear ssh expired password dialog
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
X-List-Received-Date: Mon, 02 Dec 2019 15:16:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

FYA, the dropbear SSH server "expired password dialog" patch is ready 
for review.  With this patch, if you ssh into the dropbear server 
(configured to use Linux PAM) and your password is expired, the SSH 
server lets you change your password while logging in. (Before this 
patch, dropbear would announce your password is expired, but not let you 
change it, and not give you access.)

The first email is the patch.  The second email has review materials.
https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2019q4/002174.html
https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2019q4/002175.html

Please take a look.

- Joseph


