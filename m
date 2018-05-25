Return-Path: <hannu.lounento@vaisala.com>
X-Greylist: delayed 91914 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 May 2018 14:23:59 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0086.outbound.protection.outlook.com [104.47.2.86])
	by mail.openembedded.org (Postfix) with ESMTP id 573AF748CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I132Alxc3RUBhbJrbLSV7LiSWy//jDIX06blqmjzRHc=;
	b=RrUybqaxrBjxHwUg03TS9NXYJNsh5NfuCJT9DEkrAEruCOdd5HbxPUQvbLzhBkSvA7LmmSp2LUqH+mc9SQxS7qJOggJh+/80U6mOaDA02QqzUHpXyffz9BgisVQ61VXJQR8JMslpw0CSfZJf9UZOCGot0GuNMyVcDzHSrfT4L80=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=hannu.lounento@vaisala.com; 
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by
	AM6PR0602MB3493.eurprd06.prod.outlook.com (2603:10a6:209:d::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Fri, 25 May 2018 06:50:42 +0000
From: Hannu Lounento <hannu.lounento@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 06:50:24 +0000
Message-Id: <20180525065024.105455-1-hannu.lounento@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM6PR06CA0019.eurprd06.prod.outlook.com
	(2603:10a6:20b:14::32) To AM6PR0602MB3493.eurprd06.prod.outlook.com
	(2603:10a6:209:d::26)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0602MB3493; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3493;
	3:YLIGqd2+28kzx9tGOsHKzmTRATjpapDbK514zFcN9yead2FWHSGF5BCv6+btZOOFhaBwk8gguCHKCb1qk2u6wHRTTr3/GvHOvAyh2vEAc2xZjnEEEXVtQXgsdff7bfgueJyUuvAk3RhhE0/mP3OFMpKTAjlvNRTRuRYIW14eLYME7LhugeG9pBEHkwyzbHeQYtRbBqcKoje5rbv5xNZiaCw2t2w7BJ+/iZyWfdLoS1iyNeFoxdPybGBOShlKcWNM;
	25:mi+zvZ5Yv37HjKB0+NFPcxykZRvGTXuuFMil4DrwurjRVJjKz47CpIxhuU/Z9ax2q/8ojHO4Rs4imsjfWdW4RUy+uyVwyARsmXgxjTke7q7afQ1zNqM/9NItiyCUMyZX7NWgaFl0GgZOSxTH8/X4dWOIUMDDZveurTXPsi7NfJveWBvAbjx7Vfzdl/itZ1Ojdo2klYuuxWOBLwp7TSZYCH3VBqoQW1RcuiAt21sCvSWTeWrJnCSCVfvIdu3c4Zg448b18fVHunbW9w9ki0dgeYFYHa+g55x9YdDgm3U1ZABrY1HJwKyXDZjt7Eg63hw6ihf+LlvoW94KsK70Tax7Bg==;
	31:giZfbDE8LxznJxfcKsgs8IiMNpM6HVK6oO02kIybEVUVvNVVCyAmCwVJ7qqSleqJZPWpPhpypbLdrWUjV+kSyq3rvsQ8yFB234QpNGtG9Oc6Tz3pv9UOqq34pg1GvYTTtgKhpxxr6p9LG99tws9bGD+7Fgw36hFdJBP5ZyUMo4ssL7x7rZK723J6ZU6Howz7hveEoyu5vtgeLkTer1n50qSKMriTI5y2UQYlh4vF3KA=
X-MS-TrafficTypeDiagnostic: AM6PR0602MB3493:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3493;
	20:ATl6AotL0iRif23nQfmwuJZABxr5hnA+zXFuipOpub8PiH9KdKRrm3u2zbWB54MfelrdwUG3VPzMoUNEMWAeh3zwGk1YADiH8P56iwRxGFVfDZdCqopShAV7h5/iHIRGl5bJozG19VaRnQX3KzTpik+oFCycuBTPmxwONY9ulA4=;
	4:PMzp3xY6tlY8CbYL2qZ/MvJOozf9jLyMEPK4GwfnNPht1svDM/FjSEelcoU0m84LvS22NmhDnmTEvMz6DGUh2F0JQlfLFlEJkUTe+SDqXN771MDDWooS1dkdUnJx9E2ASDaGsq28BmLgLsrzji0Mm9bmpZ317UL1iUyRIKQeDuhRvzGLiC/nVXDzXt+eECTD/VnT2C8Z8Atku7BH5ILtfeDhQEKhi4ZjokOQSRWqgedl9mrc+VD2OkVBz11KYHyh44jbl3ovtKYfz2p8J4G1Qd7IF2iTrfxdw+NBfMgrAh3GUEwAs6D9oj6m7jhUA5Bt
X-Microsoft-Antispam-PRVS: <AM6PR0602MB34938B536FCC59DE3EB452858E690@AM6PR0602MB3493.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(275740015457677);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:AM6PR0602MB3493; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0602MB3493; 
X-Forefront-PRVS: 06833C6A67
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(366004)(346002)(39380400002)(376002)(189003)(199004)(48376002)(486006)(50466002)(6916009)(106356001)(6306002)(8676002)(6486002)(44832011)(2616005)(956004)(105586002)(53936002)(1076002)(6116002)(107886003)(7696005)(3846002)(50226002)(36756003)(2361001)(476003)(52116002)(51416003)(305945005)(81166006)(81156014)(59450400001)(26005)(6666003)(5660300001)(316002)(86362001)(16586007)(386003)(8936002)(25786009)(68736007)(97736004)(2351001)(7736002)(186003)(16526019)(4326008)(2906002)(478600001)(47776003)(1857600001)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0602MB3493;
	H:hel-eptripper.corp.vaisala.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM6PR0602MB3493;
	23:hPUxMexfrEi3yKQAqAlO2Xrm2nrixm3X4fIQyDm?=
	=?us-ascii?Q?BU2S8J98IykKjOhZjkEKIVRjq106qOzPXuFwzn5noy5oTPFpPwYKZPFx2dr2?=
	=?us-ascii?Q?USoFgxkNFrCXZlGatXE6CIwl0WTLqz5r1R3SAGRceOJIOtTOFEBPGrvLDnGh?=
	=?us-ascii?Q?9t/jiYvTApic1INX7C0THfEmYPl4LQbAGOuDLVVMZ/sf4JUimb5ioCsYcixE?=
	=?us-ascii?Q?Lz7h7SEaBB+qpyRcXSr6M40kuq/iABFXfglwxH/SHxu3vJ+NfkwXB4gmcVtw?=
	=?us-ascii?Q?wfoOF7UNmLvf3kPXdtDfo1uUw5BUO9SCF+9OUALI4wOkGctEtBMBdVl0uoCV?=
	=?us-ascii?Q?uzuZk4g8Aq/QkIMiQFAr2fzk1IKUQB5lx42pkXCVoM2d56hl3KaeNd+eXVKv?=
	=?us-ascii?Q?YfScnw2oC65GXzxB/DcKbdW04YNriDlj7EkAhX6WtO2c42536CDRk5YSlnj9?=
	=?us-ascii?Q?1ZZu4UxrArq4WgiGaRp9wKtlE1sbRCV2PCzG9AunEfTdnosABLSxAoAPSc68?=
	=?us-ascii?Q?zXIDl5c5ulI7u7Omoet6jbFEyiqPnCvJsF/mPgv8edRtDgrtbk4EpZn3jYLj?=
	=?us-ascii?Q?NiNpi2QxCAFzSfFDbm5FEFsKKYeRvcFmYIkgF9OfEOE9sNsHSlbCkTm19vI9?=
	=?us-ascii?Q?JxHPvLsWv4pl2uZLrCd1lG/VwZOI7HiL9hdZcDi9MNElMKcmxf2iMQWlAk9I?=
	=?us-ascii?Q?0vx2YsBglqn+G5KoSR7sIYdjm9WhTOcsC5HIAFyrlUnUzofUHIZ1OdC4KPx7?=
	=?us-ascii?Q?u4w5loMSwzkrX4uB3yis2FwZfpgcaDoGEV2Y7OTXSw70wX35CDbDNZqnNb1H?=
	=?us-ascii?Q?OUuv9ZgGvQaX5dE6PM/zg9GNDzv/PP6+VciZH3oYJ7GaShRgVzYd1gSJJ3Ct?=
	=?us-ascii?Q?t/bkKKHSwYjvoXuDXsdGIgwZitwNskfT/HZSKbfz5KV7wvKtcxpx47ucF/jy?=
	=?us-ascii?Q?lCE+3iNgyQh+i0PQPD2WzShyi6D4H2Xpspl8ksO3W/Qv7qTLcyiVSw5b2jDe?=
	=?us-ascii?Q?SE2Hy0v3AL7Ar3/wwAjjHu55hiEgTetBGmccQA9WWkLlecTGT8MxuSoWmACS?=
	=?us-ascii?Q?sxEFgBI/EH04ekffU3z6+ZTtWqGeh25KuD+Z9qsj1mK3g4TuKTEZEk/AQsbf?=
	=?us-ascii?Q?0upG9j4uq21iYpb4ZL82MxkLDz7Ena0uLEtB34Cy5ehH1jDvqW1Bo692SgA5?=
	=?us-ascii?Q?jW8mToCHseNS52aNZlXrbxqsgvTGwIFTm3qv5X1NjCZ0dGPma4q44+W/80Og?=
	=?us-ascii?Q?7HVk5iENNuDHs/Zqaa+3jWGonnf4AHWTIF0xbAXhR?=
X-Microsoft-Antispam-Message-Info: ck5D/vjwoClz2Qolx4J0ObpBGDiE0JKTFoXAQDtt8x5+lsLzkd5ExykGYMyN75kgzCfchk6CPEk2lL+NtEixc9uJ4RF3peF9H49mLg08VvPegoWaeJ18bc3NF5uPUU+7Lm1BjtYzsue1R7h9JzMva+tOESQGnVIaYD2Bf06TDNXs/LIdsIlSesmWpqo441le
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3493;
	6:klUbhDbrI4LKfdBkiuaCv4wWTWYIxDWnxjwsm2xvGoDza5ZqL4OK9qWZt8poqzF1ZuTRhGiRPMP5z7FPrZ6ckhYA5dNcKd7mXVW9zhpHPNaTO2eymBdRC+hcKvnrH5cF2yzrypcRcnC4q0LfwLg2h3RoasamXSUfL5omFZ7HUoCfKvhGV7J0N+SfrWcNKVlc9mTS6wAL1CMke/HBvrdmI8hO0o8i/5jNmgfh6Ufe4xikyIFDkpAY0VAtvCxbCZN+QknfPo5PpjTCJMiDTfRFbSkrYRq+03UD9PCL9o6umkjcJyVktylURX87NRcrYajIWJZ8Z3fyaNWw6gNaHoWGZQzBL/MUtHcpC58GQlRNEX0LAOagvA9cKe6mg5oVirh9Jxw55BzAHq6swSfVncPR89xdvrra2Yh4XvEG5RxCctc+MNfldJTSnFYfq3f2aP9HSujJ2SxgZ0pmHj3QxTurzA==;
	5:IWQtXcwpkjoT8Y0fbR/q3Gxa/F9lBumBaYNaXbgeMUiv+5Y6LhZ8klFZgalhZKZ42yYouco4vgJZcNvVAUj5hiAiCZbfnhNKRksZeKK2WQL005TFvABNK/IFoSlX4lfXCAZc7HB/YpNVyti5sHuXLrl26RkNS3BHMp0ZxmDD/kM=;
	24:V1DpKnE7VutmWEi5CvLXzaPn9Z+WOD6ASAtkS1ElhgyrrkdsEa2HpLBgWwTZ99yJgE1uq3PCR2z5guZoNFfPbdea6RfU3tOrGcyiqdyX77E=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3493;
	7:QZ30FNr67GiTcmvhZZA3p/TgMywwrhFLCJVxRCOQkLH6jCoCqeM7CYG9f/NsXtFEKNyn6zu7kMqOocB4te66GWKAipEJcaQ28i8RnZ3SunELTmTPrcKeTLV6+WMYGdEwVNAxHKWyj+7w2DOuIjHO+EgiJ9HFgCXQoVk8LRMKnsuzxQLAHxr0/A8KblBVt6Mil17fFREYpg6n1P92gpeUmsTDx3CwzD905b9qOsSgG8TYLQVZ5Ue8/c7TXkywChxn
X-MS-Office365-Filtering-Correlation-Id: 05ed0d51-60e0-4925-19a0-08d5c20bd5d3
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2018 06:50:42.9353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ed0d51-60e0-4925-19a0-08d5c20bd5d3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3493
Subject: [PATCH] systemd: remove the group 'lock'
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
X-List-Received-Date: Fri, 25 May 2018 14:24:00 -0000
Content-Type: text/plain

The upstream commit 61f32bff6130a44d077886d38cff89ad161bf177 included in
the release v229 removed the use of the group:

    commit 61f32bff6130a44d077886d38cff89ad161bf177
    Author: Martin Pitt <martin.pitt@ubuntu.com>
    Date:   Mon Feb 1 12:09:34 2016 +0100

        tmpfiles: drop /run/lock/lockdev

        Hardly any software uses that any more, and better locking mechanisms like
        flock() have been available for many years.

        Also drop the corresponding "lock" group from sysusers.d/basic.conf.in, as
        nothing else is using this.

    [...]
    diff --git a/sysusers.d/basic.conf.in b/sysusers.d/basic.conf.in
    index 823d6cb20..b2dc5ebd4 100644
    --- a/sysusers.d/basic.conf.in
    +++ b/sysusers.d/basic.conf.in
    @@ -19,7 +19,6 @@ g wheel   -     -            -

     # Access to certain kernel and userspace facilities
     g kmem    -     -            -
    -g lock    -     -            -
     g tty     @TTY_GID@     -            -
     g utmp    -     -            -
    [...]

The upstream documentation doc/UIDS-GIDS.md says that basic.conf.in is "the
precise list of the currently defined groups":

    ## Special `systemd` GIDs

    `systemd` defines no special UIDs beyond what Linux already defines (see
    above). However, it does define some special group/GID assignments, which are
    primarily used for `systemd-udevd`'s device management. The precise list of the
    currently defined groups is found in this `sysusers.d` snippet:
    [basic.conf](https://raw.githubusercontent.com/systemd/systemd/master/sysusers.d/basic.conf.in)

    It's strongly recommended that downstream distributions include these groups in
    their default group databases.

Removing the creation of the group also avoids the need to define a GID
for it when using static ids.

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index b7c2113255..46bc30b478 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -310,7 +310,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--sys
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
-GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+GROUPADD_PARAM_${PN} = "-r systemd-journal"
 USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-- 
2.11.0


