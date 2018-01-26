Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDB578432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxX7I003799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:33 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:33 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:19 -0500
Message-ID: <e1758ac8bdf86959d1a9125af6312c1d142f02bb.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] linux-yocto/4.12: iwlwifi and pci id backports
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:32 -0000
Content-Type: text/plain

Integrating the following wilwifi and pci ID backports. These are
bug fixes, enablements and minor updates.

   850696176565 mmc: sdhci-pci: Add support for Intel CNP
   d7265bddf328 mmc: sdhci-pci: Use macros in pci_ids definition
   3a78458e37c1 spi: pxa2xx: Add support for Intel Cannonlake
   9de152318ec0 mfd: intel-lpss: Add Intel Cannonlake PCI IDs
   533713968b7d i2c: i801: Add support for Intel Cannon Lake
   b3a84be8dc44 Bluetooth: Add support for Intel Bluetooth device 9460/9560 [8087:0aaa]
   08dea20dfcdd iwlwifi: pcie: fix DMA memory mapping / unmapping
   9846e33915f4 iwlwifi: mvm: mark MIC stripped MPDUs
   d47d7a5921ec iwlwifi: mvm: enable RX offloading with TKIP and WEP
   295c08159f25 iwlwifi: mvm: flush queue before deleting ROC
   a49b4d426747 iwlwifi: add new cards for 9260 and 22000 series
   49f247c26220 iwlwifi: fix access to prph when transport is stopped
   3716aa8c7fb2 iwlwifi: pcie: fix erroneous "Read failed message"
   8ea811068131 iwlwifi: mvm: fix packet injection
   ce6f582d7790 iwlwifi: mvm: fix the TX queue hang timeout for MONITOR vif type
   789e2b172917 iwlwifi: mvm: don't use transmit queue hang detection when it is not possible
   4d697c7f2f30 iwlwifi: mvm: set correct chains in Rx status
   14f5ee3d7f2a iwlwifi: fix firmware names for 9000 and A000 series hw
   10f670720316 mac80211: add api to start ba session timer expired flow
   6975296fb60f timer: Prepare to change timer callback argument type
   617d38a55701 iwlwifi: fix PCI IDs and configuration mapping for 9000 series
   7768d0301e76 iwlwifi: mvm: support version 7 of the SCAN_REQ_UMAC FW command
   d10e7c4752ad iwlwifi: add new cards for a000 series
   f93a0bd94f2e iwlwifi: add new cards for 8265 series
   fd7fb7407891 iwlwifi: add new cards for 8260 series
   155e2cf7cf48 iwlwifi: drop RX frames during hardware restart
   a6a61a5c3dc6 iwlwifi: mvm: Convert timers to use timer_setup()
   2c55829d53e9 iwlwifi: mvm: hold mutex when flushing in iwl_mvm_flush_no_vif()
   c9d9e2dabd5b iwlwifi: mvm: add missing implementation of flush for a000 devices
   3793a1ba0652 iwlwifi: mvm: refactor iwl_mvm_flush_no_vif
   ef5fe37f634b iwlwifi: fix multi queue notification for a000 devices
   76b84cc9a0a7 iwlwifi: Add more call-sites for pcie reg dumper
   c76d3e3c5401 iwlwifi: remove host assisted paging
   d04bbe0546b1 iwlwifi: remove dead code for internal devices only
   f2aa0f94c3ed iwlwifi: mvm: improve latency when there is a reorder timeout
   16472c63581e iwlwifi: mvm: rs: remove the ANT C from the toogle antenna logic
   b12c3acdedd4 iwlwifi: mvm: reset seq num after restart
   b80a2cffd5ae iwlwifi: mvm: cleanup references to aggregation count limit
   08fb17fe5d5d iwlwifi: mvm: use RS macro instead of duplicating the code
   4ee07409e310 iwlwifi: pcie: remove set but not used variable tcph
   a707114d30c7 iwlwifi: pcie: sort IDs for the 9000 series for easier comparisons
   5437405de942 iwlwifi: mvm: add missing lq_color
   5b9fdea44032 iwlwifi: define minimum valid address for umac_error_event_table in cfg
   66130a345dc0 iwlwifi: mvm: move umac_error_event_table validity check to where it's set
   02ae1833fe0a iwlwifi: mvm: allow reading UMAC error data from SMEM in A000 devices
   92f982fbedea iwlwifi: mvm: pass baid_data to iwl_mvm_release_frames()
   f5373043dbf2 iwlwifi: mvm: remove duplicated fields in mvm reorder buffer
   46023b1981e8 iwlwifi: mvm: allocate reorder buffer according to need
   8b46150fdcba iwlwifi: remove dflt_pwr_limit from the transport
   1a0b98c751d9 iwlwifi: mvm: warn on invalid statistics size
   fd3b380a9842 iwlwifi: acpi: move code that reads SPLC to acpi
   390680e904da iwlwifi: fix indentation in a000 family configuration
   eff6a99d6123 iwlwifi: acpi: move function to get mcc into acpi code
   2c78cb7d30a5 iwlwifi: acpi: remove a couple of unnecessary ifdefs
   913d3ee53285 iwlwifi: acpi: make iwl_get_bios_mcc() use the common acpi functions
   99fb9256d5db iwlwifi: acpi: use iwl_acpi_get_wifi_pkg when reading reading SPLC
   ebe44b941059 iwlwifi: acpi: generalize iwl_mvm_sar_find_wifi_pkg()
   f9975d6cd5cb iwlwifi: acpi: move ACPI-related definitions to acpi.h
   c82427d45403 iwlwifi: acpi: move ACPI method definitions to acpi.h
   230d7769570e iwlwifi: acpi: add common code to read from ACPI
   11fe78e4e712 iwlwifi: mvm: change warning to warn_once()
   5bdafa97f8c2 iwlwifi: pcie: dump registers when HW becomes inaccessible
   e23f32f76e1b iwlwifi: mvm: add marker cmd response struct.
   29921783721e iwlwifi: fw: api: remove excess enum value documentation
   7d535c46c8a9 iwlwifi: mvm: don't send identical PHY_CTXT_CMD
   271cf21e8e38 iwlwifi: remove redundant reading from NVM file
   1f97d139cf89 iwlwifi: pcie: dynamic Tx command queue size
   49cd37c4bf52 iwlwifi: Add few debug prints to the WRT dump flow
   275329860324 iwlwifi: mvm: support firmware debug trigger on frame reorder timeout
   04901364779d iwlwifi: mvm: remove support for Link Quality Measurements
   36b34fa8d705 iwlwifi: mvm: Add new quota command API
   ebe4543c05ca iwlwifi: add a new a000 device
   c18499f54fb6 iwlwifi: fix wrong struct for a000 device
   b446945d074c iwlwifi: trans: move ref/unref code to the common part of the transport
   0c1dddd47c6e iwlwifi: mvm: add dbgfs entry for fw info
   6f04e26ed094 iwlwifi: nvm: set the correct offsets to 3168 series
   9cd4e5a40c94 iwlwifi: nvm-parse: unify channel flags printing
   81d96355b478 iwlwifi: mvm: return -ENODATA when reading the temperature with the FW down
   191792ca6c7b iwlwifi: stop dbgc recording before stopping DMA
   55b03bd59426 iwlwifi: mvm: do not print security error in monitor mode
   d25afe43ac2b iwlwifi: mvm: fix reorder buffer for 9000 devices
   dab206263245 iwlwifi: mvm: set status before calling iwl_mvm_send_cmd_status()
   4cd70ffaa6b4 iwlwifi: mvm: initialize status in iwl_mvm_add_int_sta_common()
   8b949c472671 iwlwifi: mvm: handle FIF_ALLMULTI when setting multicast addresses
   a8789c53df4c iwlwifi: mvm: wake the correct mac80211 queue
   e3fc497bcb1f iwlwifi: mvm: change state when queueing agg start work
   e64485ba374a iwlwifi: mvm: send all non-bufferable frames on the probe queue
   39853a2897ca iwlwifi: mvm: Flush non STA TX queues
   a79f9da1c39f iwlwifi: mvm: fix wowlan resume failed to load INIT ucode
   030cb8bb462b iwlwifi: mvm: only send LEDS_CMD when the FW supports it
   9d5c1397f0ba iwlwifi: mvm: bump API to 34 for 8000 and up
   0e4e899155b2 iwlwifi: mvm: Avoid deferring non bufferable frames
   bbb1538f4415 iwlwifi: fix long debug print
   fba7875cbf2b iwlwifi: pcie: move rx workqueue initialization to iwl_trans_pcie_alloc()
   cbe2772aa5ac iwlwifi: use big-endian for the hw section of the nvm
   5a9ed1a9e7a1 iwlwifi: mvm: remove useless check for mvm->cfg in iwl_parse_nvm_section()
   5dce0bb2c1e4 iwlwifi: mvm: remove useless argument in iwl_nvm_init()
   44a34b9133f6 iwlwifi: fw: fix lar_enabled endian problem in iwl_fw_get_nvm
   6ed7a437ada4 iwlwifi: add workaround to disable wide channels in 5GHz
   9fdf34b63469 iwlwifi: mvm: change open and close criteria of a BA session
   00fee168712f iwlwifi: update channel flags parser
   51fe7153860f iwlwifi: distinguish different RF modules in A000 devices
   04b2b5fe60ec iwlwifi: mvm: Fix channel switch in case of count <= 1
   12cb62ad92f1 iwlwifi: Demote messages about fw flags size to info
   ec7db94d2ac8 iwlwifi: move BT_MBOX_PRINT macro to common header
   9096228d343c iwlwifi: mvm: don't send BAR on flushed frames
   0200459abfe5 iwlwifi: mvm: remove session protection to allow channel switch
   4ed04628ce99 iwlwifi: mvm: update the firmware API in TX
   a9c710c755bd iwlwifi: mvm: use mvmsta consistently in rs.c
   db9f3872c6fa iwlwifi: mvm: group all dummy SAR function declarations together
   e59229f94610 iwlwifi: mvm: add command name for FRAME_RELEASE
   52c144d07be9 iwlwifi: pcie: support short Tx queues for A000 device family
   9768c491c7d2 iwlwifi: mvm: support new Coex firmware API
   899413b64660 iwlwifi: call iwl_remove_notification from iwl_wait_notification
   1e627b700dbb iwlwifi: mvm: consider RFKILL during INIT as success
   c9ef6cbdc1b9 iwlwifi: mvm: remove the corunning support
   6e83c9cbc23f iwlwifi: mvm: fix the coex firmware API
   537da96de818 iwlwifi: pcie: free the TSO page when a Tx queue is unmapped on A000 devices
   5fcd36459941 iwlwifi: remove references to unsupported HW
   b73ab3bf441b iwlwifi: fix nmi triggering from host
   c0594a59199d iwlwifi: pcie: don't init a Tx queue with an SSN > size of the queue
   0d23bd8c8cbf iwlwifi: mvm: add station before allocating a queue
   bd8e6c146cc2 iwlwifi: mvm: don't send CTDP commands via debugfs if not supported
   2f36c927e0b6 iwlwifi: mvm: support new beacon template command
   55ed6e274d45 iwlwifi: mvm: send delba upon rx ba session timeout
   f9cc252d82fc iwlwifi: mvm: set the default cTDP budget
   1d41aa6b2727 iwlwifi: mvm: move a000 device NVM retrieval to a common place
   e7b6180a4e80 iwlwifi: dump smem configuration when firmware crashes
   30d9d2f6ec84 iwlwifi: fix a000 RF_ID define
   064eaeb94cdd iwlwifi: add support of FPGA fw
   4d58ad2d7dd4 iwlwifi: fix a few instances of misaligned kerneldoc parameters
   a854f76ba000 iwlwifi: change functions that can only return 0 to void
   583ab36a2c38 iwlwifi: mvm: add debugfs to force CT-kill
   59f3b92bc9d5 iwlwifi: mvm: add const to thermal_cooling_device_ops structure
   6065eab05454 iwlwifi: mvm: use firmware LED command where applicable
   bdd1f8e6cd04 iwlwifi: mvm: remove useless condition in LED code
   8690797a9a10 iwlwifi: mvm: don't WARN when a legit race happens in A-MPDU
   bfa6caa712e9 iwlwifi: mvm: start mac queues when deferred tx frames are purged
   b8055bcadf7c iwlwifi: mvm: Fix a memory leak in an error handling path in 'iwl_mvm_sar_get_wgds_table()'
   446ea78b678c iwlwifi: mvm: don't retake the pointer to skb's CB
   f8fecb61f48f iwlwifi: mvm: remove non-DQA mode
   2afb27a925ce iwlwifi: mvm: rename p2p-specific sta functions to include p2p in the names
   6c1a64e3ef75 iwlwifi: mvm: simplify bufferable MMPDU check
   37d2db886acb iwlwifi: mvm: require AP_LINK_PS for TVQM
   cc0f8aa5bd8c iwlwifi: pcie: rename iwl_trans_check_hw_rf_kill() to pcie
   d680a553246e iwlwifi: mvm: add compile-time option to disable EBS
   eb39ff9703cb iwlwifi: implement fseq version mismatch warning
   248737b38907 iwlwifi: mvm: support fw reading empty OTP
   4c521e875d7a iwlwifi: pcie: fix A-MSDU on gen2 devices
   cae215d55c66 iwlwifi: mvm: fix uninitialized var while waiting for queues to empty
   3c7d7c6a8dbd iwlwifi: mvm: fix the FIFO numbers in A000 devices
   e9ac52a93832 iwlwifi: mvm: refactor beacon template command code
   585dde6c1b9b iwlwifi: dvm: remove unused defines
   7eec01ad4c9e iwlwifi: mvm: byte-swap constant instead of variable
   099c0a80ad9f iwlwifi: mvm: check family instead of new TX API for workarounds
   2e44edff43bb iwlwifi: mvm: add and use iwl_mvm_has_unified_ucode()
   571909b0fc2f iwlwifi: fw api: fix various kernel-doc warnings
   231a0f260c9f iwlwifi: reorganize firmware API
   45a9716e520c iwlwifi: refactor firmware debug code
   6bc25ab6637f iwlwifi: track current firmware image in common code
   2e8f9d07d433 iwlwifi: refactor shared mem parsing
   e99db11387dd iwlwifi: refactor out paging code
   87e461c198f2 iwlwifi: add the new 9000 series PCI IDs
   ccd7ba236f4c iwlwifi: mvm: set the RTS_MIMO_PROT bit in flag mask when sending sta to fw
   117a3d6f9f1d iwlwifi: fix fw_pre_next_step to apply also for C step
   2176967bd330 iwlwifi: mvm: rs: fix TLC statistics collection
   7e12ee6aadfd iwlwifi: mvm: set A-MPDU bit upon empty BA notification from FW
   a52eff0e4979 iwlwifi: split the regulatory rules when the bandwidth flags require it
   3a5a68e76e90 iwlwifi: add TLV for MLME offload firmware capability
   a33aab491b28 iwlwifi: mvm: fix TCP CSUM offload with WEP and A000 series
   4aaa3afd80b2 iwlwifi: mvm: defer setting IWL_MVM_STATUS_IN_HW_RESTART
   824bd3878358 iwlwifi: mvm: handle IBSS probe_queue in a few missing places
   cfa94cd7b0eb iwlwifi: fix tracing when tx only is enabled
   2137706c9531 iwlwifi: missing error code in iwl_trans_pcie_alloc()
   7f6264621aa1 iwlwifi: mvm: fix a NULL pointer dereference of error in recovery
   f20a2719d785 iwlwifi: pcie: fix unused txq NULL pointer dereference
   9e14453045b2 iwlwifi: bump MAX API for 8000/9000/A000 to 33
   b177ff5b4d37 iwlwifi: pcie: wait longer after device reset
   1a57bfb1ca30 iwlwifi: pcie: propagate iwl_pcie_apm_init's status
   5d80ae738313 iwlwifi: mvm: quietly accept non-sta disassoc frames
   4413e18698bd iwlwifi: mvm: update rx statistics cmd api
   8a1e4d649107 iwlwifi: mvm: remove DQA non-STA client mode special case
   ba3b437ac257 iwlwifi: mvm: don't mess the SNAP header in TSO for non-QoS packets
   6a8a1d8ff04f iwlwifi: pcie: reconfigure MSI-X HW on resume
   370b3f671b84 iwlwifi: mvm: don't send fetch the TID from a non-QoS packet in TSO
   dd9d9e230b3b iwlwifi: mvm: fix mac80211's hw_queue in DQA mode
   67f0a8051df7 iwlwifi: mvm: map cab_queue to real one earlier
   279ca413640e iwlwifi: mvm: fix mac80211 queue tracking
   ac34301b93d9 iwlwifi: mvm: properly enable IP header checksumming
   b7e49fba6de4 iwlwifi: pcie: add MSI-X interrupt tracing
   073e3ae0697d iwlwifi: mvm: quietly accept non-sta assoc response frames
   000225c8540e iwlwifi: mvm: remove version 2 of paging command
   01adad1afb4b iwlwifi: move configuration into sub-directory
   1c945c0a2365 iwlwifi: move notification wait into fw/
   707cab759b03 iwlwifi: create new subdirectory for FW interaction
   11498c406c1d iwlwifi: mvm: rename iwl_shared_mem_cfg_v1 to the correct _v2
   36d920ab8301 iwlwifi: mvm: fix deduplication start logic
   f639f74a16db iwlwifi: mvm: unconditionally stop device after init
   6d351ad19e9e iwlwifi: pcie: warn if paging is already initialized during init
   f440538d499e iwlwifi: pcie: make ctxt-info free idempotent
   b6d799e30c37 iwlwifi: unify external & internal modparam names
   da2431c19209 iwlwifi: mvm: support multi tid ba notif
   9ef205fbc7f6 iwlwifi: mvm: change when the BT_COEX is sent
   ffeceb4d747d iwlwifi: pcie: improve debug in iwl_pcie_rx_handle_rb()
   03eb5a5191b5 iwlwifi: mvm: support aggs of 64 frames in A000 family
   2385536aa6aa iwlwifi: pcie: improve "invalid queue" warning
   15a398ef172d iwlwifi: mvm: use proper CDB check in PHY context modify
   864be96cece8 iwlwifi: add twelve new 9560 series PCI IDs
   ec6054472dfb iwlwifi: add the new a000_2ax series
   968a39b62c95 iwlwifi: mvm: simplify CHECK_MLME_TRIGGER macro
   df311987c49c iwlwifi: mvm: change sta_id to u8
   883fb2c8e201 iwlwifi: pcie: fix 9000-series RF-kill interrupt propagation
   91acf229d6cd iwlwifi: pcie: only apply retention workaround on 9000-series A-step
   09a2f42e69fb iwlwifi: dvm: use macros for format strings
   7ca1a7dd8f3e iwlwifi: mvm: fix a bunch of kernel-doc warnings
   b458b063bc76 iwlwifi: mvm: add documentation for all command IDs
   d1790ece9b75 iwlwifi: mvm: use __le16 even for reserved fields
   046c12a1dc80 iwlwifi: mvm: remove various unused command IDs/structs
   2848902362f0 iwlwifi: mvm: fix various "Excess ... description" kernel-doc warnings
   623a8552fda4 iwlwifi: mvm: remove some CamelCase from firmware API
   e3b3b727c40d iwlwifi: mvm: Add debugfs entry to retrieve SAR geographic profile
   fdc992fb8d18 iwlwifi: mvm: refactor geo init
   c5a3a5eefbea iwlwifi: mvm: support TX on MONITOR iface
   dc57bda29216 iwlwifi: pcie: work around suspend/resume issue
   0ae7c6c46fd8 iwlwifi: mvm: fix typo in CTDP_CMD_OPERATION_REPORT description
   c7434aa46639 iwlwifi: pcie: delete the Tx queue timer earlier upon firmware crash
   958f6310f57a iwlwifi: pcie: reduce unwanted noise in the logs
   47b740d6fdad iwlwifi: mvm: print base HW address during init
   576b5f6d20aa iwlwifi: mvm: document assoc_beacon_arrive_time
   0f5456ddc9e1 iwlwifi: mvm: reset the fw_dump_desc pointer after ASSERT
   143b28afd061 iwlwifi: mvm: set assoc_beacon_arrive_time
   277925710d13 iwlwifi: pcie: make iwl_pcie_apm_stop_master() return void
   2c60b669ee2f iwlwifi: add a W/A for a scheduler hardware bug
   ea2c2d55b740 iwlwifi: mvm: don't mark TIDs that are not idle wrt BA as inactive
   6334bb289021 iwlwifi: mvm: reset the HW before dumping if HW error is detected
   47cc9c8ef1e2 iwlwifi: pcie: don't disable bh when handling FW errors
   c7507a1c27da iwlwifi: mvm: fix nvm_data leak
   997a0c1940c0 iwlwifi: remove useless iwl_free_nvm_data() function
   85ffc85a8631 iwlwifi: document transmit buffer bits better
   b354e56f9170 iwlwifi: mvm: add documentation for enum iwl_debug_cmds
   862b5ca77cb7 iwlwifi: mvm: disentangle union in TX status struct
   62bcece33632 iwlwifi: mvm: fix fw monitor 7000 HW recollecting
   779d40dcefef iwlwifi: mvm: docs: fix enum link, provide TX response link
   07654dd35785 iwlwifi: pcie: fix command completion name debug
   fe6742b239a5 iwlwifi: fix TX tracing for non-linear SKBs
   b45290710c5f iwlwifi: simplify data tracepoint
   30c0d59cb96e iwlwifi: mvm: better link scan notification results length
   2af91c751cb1 iwlwifi: pcie: use kstrtou32_from_user()
   476da255e452 iwlwifi: mvm: support aggregations on A000 HW
   9589a1e03918 iwlwifi: mvm: document status bits
   ba68df149d76 iwlwifi: pcie: remove pointless debugfs parsing for csr file
   69cb66f56e31 iwlwifi: pcie: don't report RF-kill enabled while shutting down
   95cf3d6024f3 iwlwifi: mvm: don't warn in queue sync on RF-kill
   f29197139bd5 iwlwifi: pcie: add fake RF-kill to debugfs
   9d66c60c017c iwlwifi: pcie: pull out common rfkill IRQ handling code
   ecc56c4e3f8a iwlwifi: mvm: rs: add logs for the wrong antenna case
   9fa7ff152d17 iwlwifi: mvm: make iwl_mvm_update_mcc() easier to follow
   5873c905dd46 iwlwifi: mvm: change the firmware name loading
   f48b4417b6bb iwlwifi: mvm: support D0I3_END_CMD at the start of resume
   db5d313c1366 iwlwifi: mvm: make D0I3_END_CMD sync during system resume
   cef60bd42b53 iwlwifi: mvm: track and report IBSS manager status to mac80211
   c9592bc2295b iwlwifi: use bitfield.h for some registers
   a981c4683faa iwlwifi: mvm: use scnprintf() instead of snprintf()
   94da2d3b1962 iwlwifi: pcie: fix TVQM queue ID range check
   ffc4fbe862d0 iwlwifi: mvm: remove pointless num_stored condition
   fffa02450281 iwlwifi: mvm: avoid unnecessary cache trashing in Tx path
   ef694dd2c96a iwlwifi: mvm: Enable security on new TX API
   8628d427548a iwlwifi: mvm: disable dbg data collect when fw isn't alive
   29e776b74ca4 iwlwifi: remove resp_pkt NULL checks
   b697ec7ebaa3 iwlwifi: mvm: remove txq EMPTYING_DELBA state for DQA
   c1c666e4b9e1 iwlwifi: remove unnecessary code in iwl_trans_alloc_tx_cmd
   aac2dec2caa9 iwlwifi: fw-api: cleanup cycle includes
   6d409c70b759 iwlwifi: mvm: remove SCAN_GROUP
   57cba4f2c3bb iwlwifi: mvm: link to TX commands in documentation
   2792b27534b3 iwlwifi: mvm: document structures used for BEACON_TEMPLATE_CMD
   7bafd04ebb12 iwlwifi: mvm: link queue cmd docs to A000 command structs
   c99a3509d9a9 iwlwifi: split firmware API from iwl-trans.h
   4180802e550f iwlwifi: fix a kernel-doc tag
   fee5c3ea3ccc iwlwifi: mvm: clear firmware running bit earlier
   1a6cb6ae5305 iwlwifi: mvm: convert ucode_loaded to a status bit
   28abcc34d47f iwlwifi: mvm: use schedule_delayed_work()
   2b8c8c6a247c iwlwifi: mvm: check firmware is up in debugfs
   f2a41abb9acc iwlwifi: mvm: disable prph collection in a000 hw
   8945686f242b iwlwifi: pcie: support dumping FH in a000 hw
   e8e293176ae2 iwlwifi: add 9000 and A000 device families
   3610276b8a6c iwlwifi: mvm: support init flow debugging
   ca41111b2b1c iwlwifi: mvm: add TLV for NAN API differentiation
   afbea5518455 iwlwifi: add dbgc_supported to transport configuration
   acdc73097588 iwlwifi: remove references to 8000 B-step devices
   595bbac1c406 iwlwifi: cleanup references to 8000 family in NVM code
   11faed6da368 iwlwifi: pcie: add AMSDU to gen2
   fcdca8ea1328 iwlwifi: mvm: document RX structures
   767327919d86 iwlwifi: mvm: add AMSDU flag to offload assist
   f322fb5df757 iwlwifi: mvm: fix many kernel-doc warnings
   50cc8892d845 iwlwifi: mvm: remove unused REPLY_MAX
   484994be6f9c iwlwifi: kernel-doc: make proper links
   118480297594 iwlwifi: mvm: remove unused TX_CMD_NEXT_FRAME_*
   d51079922e78 iwlwifi: Add fw_name_pre_rf_next_step to support different rf steps
   75ae58fb9f09 iwlwifi: pcie: support page dumping in wrt in gen2
   1257922aa9ba iwlwifi: mvm: remove wrt support of page dumps in gen2
   dd16d8dd7ffa iwlwifi: mvm: document structures used by commands
   c1707f389f38 iwlwifi: mvm: create/name various enums
   f7284177ca6b iwlwifi: mvm: disentangle binding command versions
   2e2a50a2385b iwlwifi: update device ID for a000 family
   1a2dfbdfc6a6 iwlwifi: mvm: add documentation links to various fields
   af89f3bcefe0 iwlwifi: mvm: fix some kernel-doc
   dd9e1bc0ab78 iwlwifi: mvm: add documentation to some WoWLAN commands
   f3a49c387b0c iwlwifi: mvm: disentangle paging command structs
   99663cdb5f32 iwlwifi: mvm: use u8 for reserved fields
   889c4a104258 iwlwifi: mvm: fix MCC endianness bug
   a391ff99187a iwlwifi: mvm: use proper sta_addr in firmware API
   27b6fcbdb9dd iwlwifi: mvm: document which group enums are used with which group ID
   6eb27e533f68 iwlwifi: mvm: fix endianness in lq_cmd declaration
   0fbd3eb814df iwlwifi: mvm: support old method of NVM parsing
   dc5fc94c7ad3 iwlwifi: mvm: support getting nvm data from firmware

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 1907db3e5ae8..712b54a3259b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6cfdf8e22b784e169254ee6e306ea08bcac5be2b"
-SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
+SRCREV_machine ?= "3cf5febafc30090aa1c0ef1ac7e5a80631201e4c"
+SRCREV_meta ?= "2a4e862a6ad55e5ee8beb62f3ea53f4b77c6f4c1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 30b4fd134c3b..85063d611396 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
-SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
+SRCREV_machine ?= "850696176565bc889670b96f0e27ab8166a8cf02"
+SRCREV_meta ?= "2a4e862a6ad55e5ee8beb62f3ea53f4b77c6f4c1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index f60e4845585f..f3ca9cc6fd90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8dff23316c2c8a291541c94f615205a0e6cc547c"
-SRCREV_machine_qemuarm64 ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
-SRCREV_machine_qemumips ?= "fbe79a19f0f14e46a8ac62de9ebb5691a5084e00"
-SRCREV_machine_qemuppc ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
-SRCREV_machine_qemux86 ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
-SRCREV_machine_qemux86-64 ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
-SRCREV_machine_qemumips64 ?= "e6d567b4c476ec7edfc6721e6912daa5fa672add"
-SRCREV_machine ?= "d572780c455fcd055baf1e6ff6fd4ea2dece9df2"
-SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
+SRCREV_machine_qemuarm ?= "02385ff70983375d3c8a4172ecded3796b266955"
+SRCREV_machine_qemuarm64 ?= "850696176565bc889670b96f0e27ab8166a8cf02"
+SRCREV_machine_qemumips ?= "508b8f61dd8477b2af91863bfb21e119301362d2"
+SRCREV_machine_qemuppc ?= "850696176565bc889670b96f0e27ab8166a8cf02"
+SRCREV_machine_qemux86 ?= "850696176565bc889670b96f0e27ab8166a8cf02"
+SRCREV_machine_qemux86-64 ?= "850696176565bc889670b96f0e27ab8166a8cf02"
+SRCREV_machine_qemumips64 ?= "6b2b8d3be7bd298684ed2a597e24360c025201ef"
+SRCREV_machine ?= "850696176565bc889670b96f0e27ab8166a8cf02"
+SRCREV_meta ?= "2a4e862a6ad55e5ee8beb62f3ea53f4b77c6f4c1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


